import os
import sqlite3
from flask import Flask, request, session, g, redirect, url_for, abort, \
    render_template, flash
import psycopg2
import psycopg2.extras

app = Flask(__name__)
app.config.from_object(__name__)

# Load default config and override config from an environment variable
app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'db', 'cards.db'),
    SECRET_KEY='development key',
    USERNAME='admin',
    PASSWORD='default'
))
app.config.from_envvar('CARDS_SETTINGS', silent=True)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


def connect_db():
    conn = psycopg2.connect("dbname='cards_local' host='localhost'")

    return conn
#
#
# def init_db():
#     db = get_db()
#     with app.open_resource('data/schema.sql', mode='r') as f:
#         db.cursor().executescript(f.read())
#     db.commit()
#
#
def get_db():
    """Opens a new database connection if there is none yet for the
    current application context.
    """
    if not hasattr(g, 'sqlite_db'):
        g.sql_db = connect_db()
    return g.sql_db


@app.teardown_appcontext
def close_db(error):
    """Closes the database again at the end of the request."""
    if hasattr(g, 'sqlite_db'):
        g.sqlite_db.close()


# -----------------------------------------------------------

# Uncomment and use this to initialize database, then comment it
#   You can rerun it to pave the database and start over
# @app.route('/initdb')
# def initdb():
#     init_db()
#     return 'Initialized the database.'


@app.route('/')
def index():
    if session.get('logged_in'):
        return redirect(url_for('general'))
    else:
        return redirect(url_for('login'))


@app.route('/cards')
def cards():
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    db = get_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    query = '''
        SELECT id, type, front, back, known
        FROM cards
        ORDER BY id DESC
    '''
    cur.execute(query)
    cards = cur.fetchall()
    return render_template('cards.html', cards=cards, filter_name="all")


@app.route('/filter_cards/<filter_name>')
def filter_cards(filter_name):
    if not session.get('logged_in'):
        return redirect(url_for('login'))

    filters = {
        "all":      "where 1 = 1",
        "general":  "where type = 1",
        "code":     "where type = 2",
        "skipped":  "where type = 9",
        "known":    "where known = true",
        "unknown":  "where known = false",
    }

    query = filters.get(filter_name)

    if not query:
        return redirect(url_for('cards'))

    db = get_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    fullquery = "SELECT id, type, front, back, known FROM cards " + query + " ORDER BY id DESC"
    cur.execute(fullquery)
    cards = cur.fetchall()
    return render_template('cards.html', cards=cards, filter_name=filter_name)


@app.route('/add', methods=['POST'])
def add_card():
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    db = get_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    cur.execute('INSERT INTO cards (type, front, back) VALUES (%s, %s, %s)',
               [request.form['type'],
                request.form['front'],
                request.form['back']
                ])
    db.commit()
    flash('New card was successfully added.')
    return redirect(url_for('cards'))


@app.route('/edit/<card_id>')
def edit(card_id):
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    db = get_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    query = '''
        SELECT id, type, front, back, known
        FROM cards
        WHERE id = %s
    '''
    cur.execute(query, [card_id])
    card = db.fetchone()
    return render_template('edit.html', card=card)


@app.route('/edit_card', methods=['POST'])
def edit_card():
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    selected = request.form.getlist('known')
    known = bool(selected)
    db = get_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    command = '''
        UPDATE cards
        SET
          type = %s,
          front = %s,
          back = %s,
          known = %s
        WHERE id = %s
    '''
    cur.execute(command,
               [request.form['type'],
                request.form['front'],
                request.form['back'],
                known,
                request.form['card_id']
                ])
    db.commit()
    flash('Card saved.')
    return redirect(url_for('cards'))


@app.route('/delete/<card_id>')
def delete(card_id):
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    db = get_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    cur.execute('DELETE FROM cards WHERE id = %s', [card_id])
    db.commit()
    flash('Card deleted.')
    return redirect(url_for('cards'))


@app.route('/general')
@app.route('/general/<card_id>')
def general(card_id=None):
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    return memorize("general", card_id)


@app.route('/code')
@app.route('/code/<card_id>')
def code(card_id=None):
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    return memorize("code", card_id)


def memorize(card_type, card_id):
    if card_type == "general":
        type = 1
    elif card_type == "code":
        type = 2
    else:
        return redirect(url_for('cards'))

    if card_id:
        card = get_card_by_id(card_id)
    else:
        card = get_card(type)
    if not card:
        flash("You've learned all the " + card_type + " cards.")
        return redirect(url_for('cards'))
    short_answer = (len(card['back']) < 75)
    return render_template('memorize.html',
                           card=card,
                           card_type=card_type,
                           short_answer=short_answer)


def get_card(type):
    db = get_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)

    query = """
      SELECT
        id, type, front, back, known
      FROM cards
      WHERE type = %s AND known = false
      ORDER BY RANDOM()
      LIMIT 1
    """

    cur.execute(query, (type,))

    return cur.fetchone()


def get_card_by_id(card_id):
    db = get_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    query = '''
      SELECT
        id, type, front, back, known
      FROM cards
      WHERE
        id = %s
      LIMIT 1
    '''

    cur.execute(query, [card_id])
    return cur.fetchone()


@app.route('/mark_known/<card_id>/<card_type>')
def mark_known(card_id, card_type):
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    db = get_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    cur.execute('UPDATE cards SET known = 1 WHERE id = %s', [card_id])
    db.commit()
    flash('Card marked as known.')
    return redirect(url_for(card_type))

@app.route('/mark_skipped/<card_id>/<card_type>')
def mark_skipped(card_id, card_type):
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    db = get_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)

    cur.execute('UPDATE cards SET type = 9 WHERE id = %s', [card_id])

    db.commit()

    flash('Card marked as skipped.')
    return redirect(url_for(card_type))


@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        if request.form['username'] != app.config['USERNAME']:
            error = 'Invalid username'
        elif request.form['password'] != app.config['PASSWORD']:
            error = 'Invalid password'
        else:
            session['logged_in'] = True
            session.permanent = True  # stay logged in
            return redirect(url_for('cards'))
    return render_template('login.html', error=error)


@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    flash("You've logged out")
    return redirect(url_for('index'))


if __name__ == '__main__':
    app.run(host='0.0.0.0')
