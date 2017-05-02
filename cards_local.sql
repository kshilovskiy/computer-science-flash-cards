--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.11
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: kshilovskiy
--

CREATE TABLE cards (
    id serial primary key,
    type smallint,
    front text,
    back text,
    known boolean DEFAULT false
);

ALTER SEQUENCE cards_id_seq RESTART WITH 1236;

ALTER TABLE cards OWNER TO kshilovskiy;

--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: kshilovskiy
--

COPY cards (id, type, front, back, known) FROM stdin;
1	1	What is Hamming Code?	In telecommunication, Hamming codes are a family of linear error-correcting codes that generalize the Hamming(7,4)-code, and were invented by Richard Hamming in 1950. Hamming codes can detect up to two-bit errors or correct one-bit errors without detection of uncorrected errors.	f
2	1	What is the square root of 256?	16	f
3	1	2^16	65,536	f
4	2	Using bitwise operations, how would you test that a number is a power of 2?	bool isPowerOfTwo = (x & (x - 1);	f
5	1	What does ELF stand for?	Executable and Linkable Format.\r\nIt's a common standard file format for executables, object code, shared libraries, and core dumps.	f
6	1	example of a latency device	CPU core	f
7	1	example of a throughput device	GPU core	f
8	1	What is the Hamming Distance?	A number used to denote the number of differences between two binary strings of the same length.	f
9	1	What are the 5 steps of the compiling process?	Lexical Analysis\r\nParsing\r\nSemantic Analysis\r\nOptimization\r\nCode Generation	f
10	1	What is parsing?	Combining tokens and groups of tokens into a tree structure (a parse tree).	f
11	1	What is lexical analysis?	The process of dividing program text into words or tokens.	f
12	1	What is code generation?	Producing a translation from a high-level program to assembly code. (Linker and Archiver taker over from here to produce machine code)	f
13	1	4 * 16	64	f
14	1	2 ^ 4	16	f
15	1	2^3	8	f
16	1	2^5	32	f
17	1	2^6	64	f
18	1	2^7	128	f
19	1	2^8	256	f
20	1	2^9	512	f
21	1	2^10	1024	f
22	1	2^11	2048	f
23	1	2^12	4096	f
24	1	2^13	8192	f
25	1	2^14	16,384	f
26	1	2^15	32,768	f
27	1	2^32	4.294 Billion	f
28	1	size of char in bits	8 bits	f
29	1	size of char in bytes	1 byte	f
30	1	size of bool in bits	8 bits	f
31	1	size of short in bits	16 bits (at least), and 16 commonly	f
32	1	size of short in bytes	2 bytes, and 2 bytes commonly	f
33	1	size of int in bits	32 bits commonly, at least 16 bits	f
34	1	size of int in bytes	4 bytes commonly, at least 2 bytes	f
35	1	size of long in bits	32 (at least, 32 commonly), 64 on LP64	f
36	1	size of long in bytes	4 bytes, (at least 4, and commonly 4), 8 on LP64	f
37	1	size of long long in bits	64 bits	f
38	1	size of long long in bytes	8 bytes	f
39	1	size of float in bits	32 bits	f
40	1	size of float in bytes	4 bytes	f
41	1	size of double in bits	64 bits	f
42	1	size of double in bytes	8 bytes	f
43	1	size of wchar_t in bits	16 bits	f
44	1	size of wchar_t in bytes	2 bytes	f
45	2	Write a function that reverses a linked list, with this argument: pointer to pointer to the head node.	void reverse(node_t **head) {\r\n  node_t *prev = NULL;\r\n  node_t *current = *head;\r\n  node_t *next = *head;\r\n\r\n  while (current) {\r\n    next = current->next;\r\n    current->next = prev;\r\n    prev = current;\r\n    current = next;\r\n  }\r\n\r\n  *head = prev;\r\n}	f
46	2	Delete a given value from a BST rooted at given node. Returns a pointer to node.	bst_node* delete_value(bst_node* node, int value) {\r\n  if (node == NULL)\r\n    return node;\r\n\r\n  if (value < node->value) {\r\n    node->left = delete_value(node->left, value);\r\n  } else if (value > node->value) {\r\n    node->right = delete_value(node->right, value);\r\n  } else { // found value\r\n\r\n    if (node->left == NULL && node->right == NULL) {\r\n      free(node);\r\n      node = NULL;\r\n    } else if (node->left == NULL) {\r\n      bst_node* temp = node;\r\n      node = node->right;\r\n      free(temp);\r\n    } else if (node->right == NULL) {\r\n      bst_node* temp = node;\r\n      node = node->left;\r\n      free(temp);\r\n    } else {\r\n      // 2 children - get min node of right subtree\r\n      int right_min = get_min(node->right);\r\n      node->value = right_min;\r\n      node->right = delete_value(node->right, right_min);\r\n    }\r\n  }\r\n\r\n  return node;\r\n}	f
47	2	Get the successor of a value in a BST rooted by given node. Returns int.	int get_successor(bst_node* node, int value) {\r\n  if (node == NULL)\r\n    return -1;\r\n\r\n  bst_node* target = node;\r\n\r\n  while (target->value != value) {\r\n    if (value < target->value) {\r\n      target = target->left;\r\n    } else if (value > target->value) {\r\n      target = target->right;\r\n    }\r\n  }\r\n\r\n  // arrived at target node\r\n  if (target->right != NULL) {\r\n    // get min value of right subtree\r\n    return get_min(target->right);\r\n  } else {\r\n    // get lowest ancestor that is a left child in the path to target value\r\n    bst_node* successor = NULL;\r\n    bst_node* ancestor = node;\r\n    while (ancestor != NULL) {\r\n      if (value < ancestor->value) {\r\n        successor = ancestor;\r\n        ancestor = ancestor->left;\r\n      } else {\r\n        ancestor = ancestor->right;\r\n      }\r\n    }\r\n\r\n    return successor->value;\r\n  }\r\n\r\n}	f
48	2	Using recursion, insert a value into a tree: root = insert(node*, int)	bst_node* insert(bst_node* node, const int value) {\r\n  if (node == 0) {\r\n    bst_node* new_node = malloc(sizeof(bst_node));\r\n    if (new_node == NULL) {\r\n      printf("Unable to allocate memory.");\r\n      exit(0);\r\n    }\r\n\r\n    new_node->value = value;\r\n    new_node->left = 0;\r\n    new_node->right = 0;\r\n\r\n    node = new_node;\r\n\r\n    return node;\r\n  }\r\n\r\n  if (value < node->value) {\r\n    node->left = insert(node->left, value);\r\n  } else if (value > node->value) {\r\n    node->right = insert(node->right, value);\r\n  }\r\n\r\n  return node;\r\n}	f
49	2	Using an iterative approach, insert a value into a BST: insert(node*, int)	void treeInsert(bst_node* node, int key) {\r\n  bst_node* new_node;\r\n  new_node = malloc(sizeof(*new_node));\r\n  assert(new_node);\r\n\r\n  new_node->key = key;\r\n  new_node->left = 0;\r\n  new_node->right = 0;\r\n\r\n  while (1) {\r\n    if (node->key > key) {\r\n      if (node->left) {\r\n        node = node->left;\r\n      } else {\r\n        node->left = new_node;\r\n        return;\r\n      }\r\n    } else {\r\n      if (node->right) {\r\n        node = node->right;\r\n      } else {\r\n        node->right = new_node;\r\n        return;\r\n      }\r\n    }\r\n  }\r\n}	f
72	2	Describe the universal hashing function for an integer. What arguments would it need? What would it look like?	/*\r\n  key = the Key \r\n  a = random number from 1 to p-1\r\n  b = random number from 0 to p-1\r\n  p = a prime number >=m\r\n  m = the size of the array\r\n*/\r\nint hash(int key, int a, int b, int p, int m) {\r\n  return ((a * x + b) % p) % m;\r\n}	f
901	1	How would you calculate P(A or B)?	P(A) + P(B) - P(AB)	f
50	2	Write a method is_binary_search_tree that returns true if a given tree is a BST (use helper function).	bool is_binary_search_tree(bst_node* node) {\r\n  if (node == NULL) return true;\r\n\r\n  return is_between(node, INT_MIN, INT_MAX);\r\n}\r\n\r\nbool is_between(bst_node* node, int min, int max) {\r\n  if (node == NULL) return true;\r\n\r\n  // ensure subtrees are not hiding a value lower or higher than the subtree\r\n  // allows\r\n  return node->value > min && node->value < max &&\r\n         is_between(node->left, min, node->value) &&\r\n         is_between(node->right, node->value, max);\r\n}	f
51	2	Using an iterative approach, write a function find_node(bst_node* root, int target) that returns the node with the given target value in a BST.	bst_node* find_node(bst_node* root, int target) {\r\n  while (root != NULL && root->key != target) {\r\n    if (root->key > target) {\r\n      root = root->left;\r\n    } else {\r\n      root = root->right;\r\n    }\r\n  }\r\n  return root;\r\n}	f
52	2	Using an recursive approach, write a function: find_node(bst_node* node, int value) that returns the node with the given target value in a BST.	bst_node* find_node(bst_node* node, int value) {\r\n  if (node == NULL)\r\n    return false;\r\n\r\n  if (value < node->value) {\r\n    return find_node(node->left, value);\r\n  } else if (value > node->value) {\r\n    return find_node(node->right, value);\r\n  } else {\r\n    return node;\r\n  }\r\n}	f
53	2	Function that returns the height (in nodes) of a BST: int get_height(bst_node* node)	int get_height(bst_node* node) {\r\n  if (node == NULL) {\r\n    return 0;\r\n  }\r\n\r\n  return 1 + max_num(get_height(node->left), get_height(node->right));\r\n}	f
54	1	How many levels in a complete binary tree of size n?	floor(1 + log(base2)(n))	f
55	1	How can build heap be done in linear time?	A tree of size n nodes, will have floor(n/2^h) nodes with height >= h.\r\nThe last half of nodes will be leaves, so they already satisfy the heap property. No work needs to be done on them.\r\ngoing bottom-up (ignoring the last n/2 items) and satisfying the heap property one level at a time, each level going up the tree has to do at most 1 operation more than the level below it. But as you go up the tree, higher levels have fewer nodes, so you may be doing more operations, but it happens on fewer number of times.\r\nThis resembles a series:\r\n\r\nn/2 - height 1: 1 operations\r\nn/4 - height 2: 2 operation\r\nn/8 - height 3: 3 operations\r\n...\r\ngoing to floor(n/2^h) - height h: h operations\r\n\r\nn * (1/2 + 2/4 + 3/8 + 4/16 ....) = n * 1 = n	f
56	2	C or Python: Sort an array of numbers using heap sort.	void heap_sort(int* numbers, int count) {\r\n  int temp;\r\n  for (int i = count - 1; i > 0; --i) {\r\n    temp = numbers[i];\r\n    numbers[i] = numbers[0];\r\n    numbers[0] = temp;\r\n\r\n    percolate_down(numbers, i, 0);\r\n  }\r\n}\r\n\r\nvoid heapify(int* numbers, int count) {\r\n  for (int i = count / 2 - 1; i >= 0; --i) {\r\n    percolate_down(numbers, count, i);\r\n  }\r\n}\r\n\r\nvoid percolate_down(int* numbers, int count, int index) {\r\n  while (index * 2 + 1 < count) {\r\n    int swap_index = index;\r\n    int left_child_index = index * 2 + 1;\r\n    int right_child_index = index * 2 + 2;\r\n    bool has_left_child = left_child_index < count;\r\n    bool has_right_child = right_child_index < count;\r\n\r\n    if (has_left_child && has_right_child) {\r\n      if (numbers[left_child_index] > numbers[right_child_index]) {\r\n        swap_index = left_child_index;\r\n      } else {\r\n        swap_index = right_child_index;\r\n      }\r\n    } else if (has_left_child) {\r\n      swap_index = left_child_index;\r\n    } else if (has_right_child) {\r\n      swap_index = right_child_index;\r\n    } else {\r\n      break;\r\n    }\r\n\r\n    if (numbers[swap_index] > numbers[index]) {\r\n      int temp = numbers[index];\r\n      numbers[index] = numbers[swap_index];\r\n      numbers[swap_index] = temp;\r\n\r\n      index = swap_index;\r\n    } else {\r\n      break;\r\n    }\r\n  }\r\n}	f
57	1	How are queues usually implemented?	Using a Circular Array or Singly Linked List.	f
58	1	How is a deque usually implemented?	Using a Circular Array or Doubly Linked List.	f
59	2	How would you swap 2 integers using only bitwise operations?	a ^= b\r\nb ^= a\r\na ^= b	f
60	2	How would you turn ON the 3rd bit from the end in a bitstring?	x |= (1 << 2)	f
61	2	How would you turn OFF the 3rd bit from the end in a bitstring?	x &= ~(1 << 2);	f
62	2	Write a function that calculates the Hamming distance.	def hamming_distance(x, y):  \r\n    difference = x ^ y\r\n    count = 0\r\n    while difference != 0:\r\n        count += 1\r\n        difference &= difference - 1\r\n    return count	f
63	2	Write a function to calculate the Hamming weight of an integer. (Kernighan method)	int countSetBits(int n) {\r\n  int count = 0;\r\n\r\n  while (n) {\r\n    n = n & (n - 1);\r\n    ++count;\r\n  }\r\n\r\n  return count;\r\n}	f
64	2	Write a function that calculates the Hamming weight in constant time. Divide and Conquer strategy.	int countSetBits(unsigned int n) {\r\n  n = n - ((n >> 1) & 0x55555555);\r\n  n = (n & 0x33333333) + ((n >> 2) & 0x33333333);\r\n  n = (n + (n >> 4)) & 0x0F0F0F0F;\r\n  n = n + (n >> 8);\r\n  n = n + (n >> 16);\r\n\r\n  return n & 0x0000003F;\r\n}	f
65	2	Write a function that tells you if a number is even, using bitwise operation.	def is_even(x):\r\n    return x & 1 == 0	f
66	2	Write a function to add 2 integers using bitwise operations.	def add(a, b):\r\n    while a:\r\n        c = b & a\r\n        b ^= a\r\n        c <<= 1\r\n        a = c\r\n    return b	f
67	2	Write a function to get the sign of an integer.	def get_sign(x):\r\n    return -(x < 0)	f
68	2	Write a function to calculate the absolute value of a 32-bit integer.	def myabs(x):\r\n    high_bit_mask = x >> 31\r\n    return (x ^ high_bit_mask) - high_bit_mask	f
69	2	Write a binary search function that works iteratively, taking a target int, array of ints, and size of the array, returning the index of the found item, or -1.	int binary_search(int target, int numbers[], int size) {\r\n  int low = 0;\r\n  int high = size - 1;\r\n  int mid = 0;\r\n  while (low <= high) {\r\n    mid = (high + low) / 2;\r\n\r\n    if (target > numbers[mid]) {\r\n      low = mid + 1;\r\n    } else if (target < numbers[mid]) {\r\n      high = mid - 1;\r\n    } else {\r\n      return mid;\r\n    }\r\n  }\r\n\r\n  return -1;\r\n}	f
70	2	Write a binary search function that works recursively, returning the index of the found item, or -1.	int binary_search_recur(int target, int numbers[], int low, int high) {\r\n  if (low > high) {\r\n    return -1;\r\n  }\r\n\r\n  int mid = (high + low) / 2;\r\n\r\n  if (target > numbers[mid]) {\r\n    return binary_search_recur(target, numbers, mid + 1, high);\r\n  } else if (target < numbers[mid]) {\r\n    return binary_search_recur(target, numbers, low, mid - 1);\r\n  } else {\r\n    return mid;\r\n  }\r\n}	f
71	2	In C or Python, Write a universal hashing function for a string, taking as arguments a string and the capacity of the hashtable.	int hash(const char* key, const int m) {\r\n  int hash = 0;\r\n\r\n  for (int i = 0; i < key[i] != '\\0'; ++i) {\r\n    hash = hash * 31 + key[i];\r\n  }\r\n\r\n  return abs(hash % m);\r\n}	f
135	1	What is the value of the geometric (exponential) series when x != 1: 1 + x + x^2 + x^3 + ... x^n ?	(x^(n + 1) - 1) / (x - 1)	f
136	1	What is the sum of this series when it's infinite and x < 1? 1 + x + x^2 + x^3 + ... x^n ?	1 / (1 - x)	f
73	1	What is a Binary Search Tree?	A binary tree is a data structure where each node has a comparable key and satisfies the restriction that the key in any node is larger than the keys in all nodes in that node's left subtree and smaller than the keys in all nodes in that node's right subtree.	f
74	1	What is an AVL tree?	A BST where the height of every node and that of its sibling differ by at most 1.	f
75	1	What is a red-black tree?	BSTs having red and black links satisfying:\r\n- Red links lean left\r\n- No node has two links connected to it\r\n- The tree has perfect black balance: every path from the root to a null link has the same number of blacks	f
76	1	What is a splay tree?	A self-adjusting binary search tree where recently accessed elements are moved to the root so they are quick to access again.	f
77	1	What is a treap?	A random priority is assigned to every key and must maintain two properties:\r\n-They are in order with respect to their keys, as in a typical binary search tree\r\n-They are in heap order with respect to their priorities, that is, no key has a key of lower priority as an ancestor\r\nO(log N) expected time for all operations, O(N) worst case.	f
78	1	What is typical cache line size?	64 bytes.\r\n\r\n-- extra below --\r\n\r\nTo know the sizes, you need to look it up using the documentation for the processor, afaik there is no programatic way to do it. On the plus side however, most cache lines are of a standard size, based on intels standards. On x86 cache lines are 64 bytes, however, to prevent false sharing, you need to follow the guidelines of the processor you are targeting (intel has some special notes on its netburst based processors), generally you need to align to 64 bytes for this (intel states that you should also avoid crossing 16 byte boundries).\r\n\r\nTo do this in C or C++ requires that you use aligned_malloc or one of the compiler specific specifiers such as __attribute__((align(64))) or __declspec(align(64)). To pad between members in a struct to split them onto different cache lines, you need on insert a member big enough to align it to the next 64 byte boundery	f
79	1	What is latency?	Latency is the delay from input into a system to desired outcome. The time interval between between a stimulus and response.	f
80	1	What is a y-fast trie?	A y-fast trie is a data structure for storing integers from a bounded domain. It supports exact and predecessor or successor queries in time O(log log M), using O(n) space, where n is the number of stored values and M is the maximum value in the domain. The structure was proposed by Dan Willard in 1982 to decrease the O(n log M) space used by an x-fast trie.	f
81	1	What is an x-fast trie?	An x-fast trie is a data structure for storing integers from a bounded domain. It supports exact and predecessor or successor queries in time O(log log M), using O(n log M) space, where n is the number of stored values and M is the maximum value in the domain. The structure was proposed by Dan Willard in 1982, along with the more complicated y-fast trie, as a way to improve the space usage of van Emde Boas trees, while retaining the O(log log M) query time.	f
82	1	What is a van Emde Boas tree?	The van Emde Boas tree supports insertions, deletions, lookups, successor queries, and predecessor queries in time O(log log U), where U is the universe of items to store. Items are stored in clusters of size sqrt(U). \r\n\r\nThe van Emde Boas data structure divides the range {0,...,n−1} into blocks of size sqrt(n), which we call clusters. Each cluster is itself a vEB structure of size sqrt(n). In addition, there is a “summary” structure that keeps track of which clusters are nonempty.\r\n\r\nMore detail:\r\nA van Emde Boas tree (or van Emde Boas priority queue), also known as a vEB tree, is a tree data structure which implements an associative array with m-bit integer keys. It performs all operations in O(log m) time, or equivalently in O(log log M) time, where M = 2m is the maximum number of elements that can be stored in the tree. The M is not to be confused with the actual number of elements stored in the tree, by which the performance of other tree data-structures is often measured. The vEB tree has good space efficiency when it contains a large number of elements, as discussed below. It was invented by a team led by Dutch computer scientist Peter van Emde Boas in 1975.	f
83	1	What is a compressed trie?	It's a trie where the non-branching paths are compacted into a single edge.	f
84	1	What relationship of the keys do you lose with a hash table?	The ordering of the keys.	f
85	2	Sed command to take a file separated by spaces, turn spaces into newlines, and then sort it alphabetically.	sed 's/ /\\n/g' words.txt | sort	f
86	2	Print columns 2, 3, and 6 from the date command.	date | awk '{print $2, $3, $6}'	f
87	2	Take a file delimited by : and make it tab-delimited.	cat /etc/passwd | sed 's/:/\\t/g'	f
88	2	Output a file with line numbers.	cat -n somefile	f
89	1	Is quicksort stable?	No.	f
90	1	Can quicksort be done in-place?	Yes.	f
91	1	Can merge sort be done in-place?	No. It requires O(n) space. There is an in-place version?	f
92	1	Is merge sort stable?	Yes.	f
93	1	Is insertion sort stable?	Yes.	f
94	1	Can insertion sort be done in-place?	Yes.	f
95	1	Can selection sort be done in-place?	Yes.	f
96	1	Is selection sort stable?	No.	f
97	1	Is heap sort stable?	No.	f
98	1	Can heap sort be done in-place?	Yes.	f
99	2	Write merge sort in C (check answer carefully)	void merge(int numbers[], int low, int mid, int high) {\r\n  // temp array for holding sorted items\r\n  int b[high - low - 1];\r\n  int i = low;\r\n  int j = mid + 1;\r\n  int k = 0;\r\n\r\n  // merge items from list in order\r\n  while (i <= mid && j <= high) {\r\n    if (numbers[i] <= numbers[j]) {\r\n      b[k++] = numbers[i++];\r\n    } else {\r\n      b[k++] = numbers[j++];\r\n    }\r\n  }\r\n\r\n  // copy the remaining items to tmp array\r\n  while (i <= mid) b[k++] = numbers[i++];\r\n  while (j <= high) b[k++] = numbers[j++];\r\n\r\n  --k;\r\n  while (k >= 0) {\r\n    numbers[low + k] = b[k];\r\n    --k;\r\n  }\r\n}\r\n\r\nvoid merge_sort(int numbers[], int low, int high) {\r\n  if (low < high) {\r\n    int mid = (low + high) / 2;\r\n\r\n    merge_sort(numbers, low, mid);\r\n    merge_sort(numbers, mid + 1, high);\r\n    merge(numbers, low, mid, high);\r\n  }\r\n}	f
137	1	What is the sum of the harmonic series for the nth harmonic number: 1 + 1/2 + 1/3 + 1/4 .. + 1/n	No closed form, only good approximations:\r\n\r\n≈ 0.57721\r\nthe Euler-Mascheroni constant.	f
138	1	What is the maximum unsigned integer you can represent with n bits?	2^n - 1	f
139	1	Given a fully balanced binary tree with x nodes, what is the height of the tree in nodes?	log(base2) x + 1	f
140	1	Given a fully balanced k-ary tree with x nodes, what is the height of the tree in nodes?	log(basek) x + 1	f
141	1	A binary tree with height h can contain at most how many nodes?	2^(h+1) − 1 nodes	f
902	1	What's another way to write P(A and B)?	P(AB)	f
100	2	Write a MergeSort class in Python (check answer carefully)	class MergeSort(object):\r\n    def __init__(self, numbers):\r\n        self.values = numbers\r\n        self.count = len(numbers)\r\n\r\n    def sort(self):\r\n        self.merge_sort(0, self.count - 1)\r\n        return self.values\r\n\r\n    def merge_sort(self, low, high):\r\n        if low < high:\r\n            mid = (low + high) // 2\r\n\r\n            self.merge_sort(low, mid)\r\n            self.merge_sort(mid + 1, high)\r\n            self.merge(low, mid, high)\r\n\r\n    def merge(self, low, mid, high):\r\n        b = []\r\n        i = low\r\n        j = mid + 1\r\n\r\n        while i <= mid and j <= high:\r\n            if self.values[i] <= self.values[j]:\r\n                b.append(self.values[i])\r\n                i += 1\r\n            else:\r\n                b.append(self.values[j])\r\n                j += 1\r\n\r\n        while i <= mid:\r\n            b.append(self.values[i])\r\n            i += 1\r\n\r\n        while j <= high:\r\n            b.append(self.values[j])\r\n            j += 1\r\n\r\n        for index, val in enumerate(b):\r\n            self.values[low + index] = val	f
101	2	Write quick sort in C with only one method and random pivot (check answer carefully)	void quick_sort(int numbers[], int left, int right) {\r\n\r\n  if (left == right)\r\n    return;\r\n\r\n  int i = left;\r\n  int j = right;\r\n  int temp = 0;\r\n\r\n  int count = right - left;\r\n  int pivot_mod = rand() % count;\r\n\r\n  int pivot = numbers[left + pivot_mod];\r\n\r\n  while (i <= j) {\r\n    while (numbers[i] < pivot) ++i;\r\n    while (numbers[j] > pivot) --j;\r\n\r\n    if (i <= j) {\r\n      temp = numbers[i];\r\n      numbers[i] = numbers[j];\r\n      numbers[j] = temp;\r\n      ++i;\r\n      --j;\r\n    }\r\n  }\r\n\r\n  if (left < j) {\r\n    quick_sort(numbers, left, j);\r\n  }\r\n\r\n  if (right > i) {\r\n    quick_sort(numbers, i, right);\r\n  }\r\n}	f
102	2	Write a QuickSort class in Python (check answer carefully)	import random\r\n\r\nclass QuickSort(object):\r\n\r\n    def __init__(self, numbers):\r\n        self.values = numbers\r\n        self.count = len(self.values)\r\n\r\n    def sort(self):\r\n        self.quick_sort(0, self.count - 1)\r\n        return self.values\r\n\r\n    def quick_sort(self, left, right):\r\n        if left == right:\r\n            return\r\n\r\n        i = left\r\n        j = right\r\n\r\n        pivot_index = random.randint(left, right)\r\n\r\n        pivot = self.values[pivot_index]\r\n\r\n        while i <= j:\r\n            while self.values[i] < pivot:\r\n                i += 1\r\n            while self.values[j] > pivot:\r\n                j -= 1\r\n            if i <= j:\r\n                if i < j:\r\n                    temp = self.values[i]\r\n                    self.values[i] = self.values[j]\r\n                    self.values[j] = temp\r\n                i += 1\r\n                j -= 1\r\n\r\n        if left < j:\r\n            self.quick_sort(left, j)\r\n        if right > i:\r\n            self.quick_sort(i, right)	f
103	1	In what case would perfect hashing be practical?	When you don't need to support inserts or deletes. The data is static.	f
104	1	How does perfect hashing handle collisions?	It creates a second hash table in the buckets where there are multiple items (k), using a second hash function, and k^2 space. The hash table has two hashing levels. k^2 is chosen because the Markov inequality (birthday paradox) ensures we will not have collisions in bucket.	f
105	1	What is the optimal load factor for a hash table?	O(sqrt(n))	f
106	1	What is the expected load factor for a hash table?	n/m,  where n = items, m = buckets) n/m is also called alpha.	f
107	1	What is the technical running time for operations on a hash table?	O(1 + alpha), where alpha is the load factor (n/m). Table doubling operations are amortized.	f
108	1	What is the worst-case search time of perfect hashing?	O(1)	f
109	1	What is the worst-case space required for perfect hashing?	O(n)	f
110	1	What's the best-case running time of binary search?	O(1) - we get lucky and find the element right at the midpoint.	f
111	1	What's the worst-case running time of binary search?	O(log n)	f
112	1	What are the downsides of using an adjacency matrix to represent a graph?	Finding all the outgoing edges from a vertex takes O(n) time even if there aren't very many, and the O(n^2) space cost is high for "sparse graphs," those with much fewer than n^2 edges.	f
113	1	When is using an adjacency list expensive?	Finding predecessors of a node u is extremely expensive, requiring looking through every list of every node in time O(n + e), where e is the total number of edges, although if this is something we actually need to do often we can store a second copy of the graph with the edges reversed.	f
114	1	When are adjacency lists most useful?	Adjacency lists are most useful when we mostly want to enumerate outgoing edges of each node. This is common in search tasks, where we want to find a path from one node to another or compute the distances between pairs of nodes. If other operations are important, we can optimize them by augmenting the adjacency list representation; for example, using sorted arrays for the adjacency lists reduces the cost of edge existence testing to O(log(d+ (u))), and adding a second copy of the graph with reversed edges lets us find all predecessors of u in O(d− (u)) time, where d− (u) is u's in-degree.	f
115	1	What is the space required for a graph using an adjacency list?	O(n + e)	f
116	1	What's the maximum unsigned number you can represent with 4 bits?	15	f
117	1	What's the maximum unsigned number you can represent with 8 bits?	255	f
118	1	What's the maximum unsigned number you can represent with 16 bits?	65,535	f
119	1	What's the maximum unsigned number you can represent with 6 bits?	63	f
120	1	What's the maximum unsigned number you can represent with 15 bits?	32,767	f
121	1	What's the maximum signed number you can represent with 4 bits?	7	f
122	1	What's the maximum signed number you can represent with 16 bits?	32,767	f
123	1	What's the maximum signed number you can represent with 8 bits?	127	f
125	1	What's the maximum signed number you can represent with 9 bits?	255	f
126	1	What's the maximum unsigned number you can represent with 32 bits?	4.294 Billion	f
127	1	What's the maximum signed number you can represent with 32 bits?	2.147 Billion	f
128	1	How do you get the logarithm of a number n given a base b?	Keep dividing n by b until you get to a number <= 1.	f
129	1	How can you write log(base b)(ac)?	log(base b)a + log(base b)c	f
130	1	How can you write log(base b)(a/c)?	log(base b)a - log(base b)c	f
131	1	How else can you write log(base b)(a^c)?	c * log(base b)a	f
132	1	How you can express log(base b)a as another base?	log(base d)a / log(base d)b	f
133	1	Why is log(base2)(2^n) == n?	log(base2)(2^n) = n * log(base 2)2 = n * 1 = n	f
134	1	What is the arithmetic series: 1 + 2 + 3 + 4 + ... (n - 1) + n?	(n(n+1)) / 2	f
142	1	For a k-ary tree with height h, the upper bound for the maximum number of leaves is:	k^h	f
143	1	What is the complexity of Dijkstra's shortest-path algorithm?	O(e log v), where e is the number of edges. \r\nIt must scan each edge, and gets and updates values on the heap.	f
144	1	What is a drawback of using an adjacency matrix for an undirected graph?	Half of the entries in the matrix are duplicates.	f
145	1	What is the memory needed to store an adjacency list?	Theta( |V| + |E| )	f
146	1	What is the memory needed to store an adjacency matrix?	Theta(|V|^2)	f
147	1	How would you implement a queue with a linked list?	Use a tail pointer. Push new items at the tail, pop items at the head. Both operations are constant-time.	f
148	1	How would you implement a stack with a linked list?	Push and pop items at the head. Both operations are constant-time.	f
149	1	What preference of nodes vs leaves does preorder traversal give on a tree?	Nodes first, leaves later.	f
150	1	What preference of nodes vs leaves does postorder traversal give on a tree?	Leaves first, internal nodes later.	f
151	1	What could you use in DFS to turn a recursive algorithm into an interative one?	A stack.	f
152	1	What do you use to keep track of nodes to visit in BFS?	A queue.	f
153	1	Using a stack to keep track of unvisited nodes gives what kind of traversal?	DFS	f
154	1	Using a queue to keep track of unvisited nodes gives what kind of traversal?	BFS	f
155	1	In a highly connected graph of n vertices, how many cycles can there be?	(n - 1)! - enumerating is possible (using backtracking), but there will be a lot.	f
156	1	What can use to find if a graph is bipartite?	BFS. Using only 2 colors. When you encounter a new vertex, if it has no color, give it the opposite color of its parent vertex. If it is already colored the same, the graph is not bipartite.	f
157	1	How can you find a cycle in a graph?	DFS. If you discover an edge that connects to an ancestor (previously discovered vertex), you have a cycle.	f
158	1	What is an articulation vertex?	A vertex of a graph whose deletion disconnects the graph.	f
159	1	How can you find an articulation vertex?	DFS multiple times. Remove each edge one at a time, doing a DFS after each, so see if you end up with > 1 connected components. If you remove a node and then DFS and find you have fewer than m - 1 edges, you've deleted an articulation vertex. O(n(n+m))\r\n\r\nA faster way, with a little more bookkeeping, can be done in O(n+m) time, if you do DFS and keep track of parents and make a note when you reach a back edge, which connects to an ancestor.	f
160	1	How could you identify errors in a DNA fragment assembly given many pairs of sequences, where item A must appear before B in the larger sequence?	Build a DAG representing all the left-right constraints. Any topological sort of the DAG is a consistent ordering. If there are cycles, there must be errors.	f
161	1	What path does BFS find in a graph?	The shortest path tree from start to all nodes (unweighted)	f
163	1	What's the upper bound on the number of edges in a graph G(V, E)?	|V|^2	f
164	2	In Python, initialize a list of lists called x with 100 elements.	x = [[] for i in range(100)]	f
165	2	In Python, declare a named tuple called Edge, with attributes vertex and weight.	from collections import namedtuple\r\n\r\nEdge = namedtuple('Edge', ['vertex', 'weight'])	f
166	1	What is the optimal substructure property tell us about shortest paths?	That a subpath of a shortest path is also a shortest path.	f
167	2	C++: How would you initialize a vector of 25 integers to all zeroes?	std::vector<int> mynums(25);	f
168	2	C++: How could you make a string called thing2 have the first 5 characters of thing1?	thing2.assign(thing1, 0, 5);	f
169	2	C++: We want to call parent constructor in our MyClass constructor, with an arg int called foo. What does this look like in .h and .cc? Parent is ParentClass.	.h:\r\nMyClass(const int foo);\r\n\r\n.cc:\r\nMyClass::MyClass(const int foo) : ParentClass(foo) {\r\n    // stuff\r\n}	f
170	1	What is a Dunder method?	A magic method in Python, such as __getitem__ and __len__.	f
171	1	What is the sum of numbers from 1 to 2^n?	2^(n+1) - 1\r\nThe sum of a sequence of powers is roughly equal to the next value in the sequence.	f
172	1	How many ways can you rearrange a string of n unique characters?	n!\r\nPermutations.	f
173	1	How many ways can you arrange k characters from n unique characters?	n! / (n - k)!\r\nPermutation of n elements of size k.	f
174	1	How many subsets (ordering doesn't matter) of size k are there in n unique characters?	n! / k!(n - k)!\r\nThis is n choose k.	f
175	2	Python: Write a class function to tell if the graph is bipartite. Start with vertex 0. You can access the adjacency list for a vertex v with: self.adjacency_list[v]	def is_bipartite(self):\r\n        """\r\n        Returns true if graph is bipartite\r\n        :rtype: bool\r\n        """\r\n        colorings = {}\r\n        to_visit = queue.Queue()\r\n        to_visit.put(0)\r\n        colorings[0] = 0\r\n\r\n        while not to_visit.empty():\r\n            v = to_visit.get()\r\n\r\n            for u in self.adjacency_list[v]:\r\n                if u not in colorings:\r\n                    colorings[u] = 1 - colorings[v]\r\n                    to_visit.put(u)\r\n                elif colorings[u] == colorings[v]:\r\n                    return False\r\n\r\n        return True	f
176	1	What should you avoid in your base case in recursion?	Too many base case scenarios. Just have one base case so you can return as quickly as possible. Avoid "arm's length" recursion.	f
177	1	What is the bandwidth of a graph?	The longest edge in the permutation that gives you the shortest edges.	f
179	1	When talking dynamic programming, what is feasibility?	The rules the algorithm must adhere to in reaching its solution.	f
180	1	When talking dynamic programming, what is optimality?	An algorithm has optimality if the subsolutions of an optimal solution of the problem are themsleves optimal solutions for their subproblems.	f
198	1	What are some advantages to arrays over linked lists?	- Linked structures require extra space for storing pointer fields.\r\n- Linked lists do not allow efficient random access to items.\r\n- Arrays allow better memory locality and cache performance than random pointer jumping.	f
228	2	Python: How would you remove indices 6 to 11 in a list foo?	del foo[6:12]	f
229	2	Python: How can you tell if an index is in a list?	if 0 < i < len(foo):	f
230	2	Python: How to output today's date, like August 10, 2016	import datetime\r\n\r\ncurrentDate = datetime.date.today()\r\nprint(currentDate.strftime("The date is %B %d, %Y"))	f
231	2	Python: How to output today's date, like 8/10/2016 (August, not October)	import datetime\r\n\r\ncurrentDate = datetime.date.today()\r\nprint(currentDate.strftime("The date is %m/%d/%Y"))	f
181	1	What is dynamic programming?	Dynamic programming is a general-purpose algorithm design technique that is most often used to solve combinatorial optimization problems, where we are looking for the best possible input to some function chosen from an exponentially large search space.\r\n\r\nThere are two parts to dynamic programming. The first part is a programming technique: dynamic programming is essentially divide and conquer run in reverse: we solve a big instance of a problem by breaking it up recursively into smaller instances; but instead of carrying out the computation recursively from the top down, we start from the bottom with the smallest instances of the problem, solving each increasingly large instance in turn and storing the result in a table. The second part is a design principle: in building up our table, we are careful always to preserve alternative solutions we may need later, by delaying commitment to particular choices to the extent that we can.\r\n\r\nThe bottom-up aspect of dynamic programming is most useful when a straightforward recursion would produce many duplicate subproblems. It is most efficient when we can enumerate a class of subproblems that doesn't include too many extraneous cases that we don't need for our original problem.	f
182	1	What is the complexity for a naive recursive Fibonacci function?	Θ(φ^n), where phi(φ) is the golden ratio (1 + sqrt(5)) / 2. \r\napprox: 1.618	f
183	2	Write a dynamic programming version of computing Fibonacci for n.	def fib(n):\r\n   fibValues = [0,1]\r\n   for i in range(2, n+1):\r\n      fibValues.append(fibValues[i-1] + fibValues[i-2])\r\n\r\n   return fibValues[n]	f
184	2	Write a dynamic programming implementation of longest common subsequence of 2 strings.	def longest_common_subsequence(sequence1, sequence2):\r\n    cols = len(sequence1) + 1   # Add 1 to represent 0 valued column for DP\r\n    rows = len(sequence2) + 1   # Add 1 to represent 0 valued row for DP\r\n\r\n    T = [[0 for _ in range(cols)] for _ in range(rows)]\r\n\r\n    max_length = 0\r\n\r\n    for i in range(1, rows):\r\n        for j in range(1, cols):\r\n            if sequence2[i - 1] == sequence1[j - 1]:\r\n                T[i][j] = 1 + T[i - 1][j - 1]\r\n            else:\r\n                T[i][j] = max(T[i - 1][j], T[i][j - 1])\r\n\r\n            max_length = max(max_length, T[i][j])\r\n\r\n    return max_length	f
185	2	Python: Implement the Floyd-Warshall algorithm (all pairs shortest paths).	# Python Program for Floyd Warshall Algorithm\r\n \r\n# Number of vertices in the graph\r\nV = 4\r\n \r\n# Define infinity as the large enough value. This value will be\r\n# used for vertices not connected to each other\r\nINF  = 99999\r\n \r\n# Solves all pair shortest path via Floyd Warshall Algrorithm\r\ndef floydWarshall(graph):\r\n \r\n    """ dist[][] will be the output matrix that will finally\r\n        have the shortest distances between every pair of vertices """\r\n    """ initializing the solution matrix same as input graph matrix\r\n    OR we can say that the initial values of shortest distances\r\n    are based on shortest paths considerting no \r\n    intermedidate vertices """\r\n    dist = map(lambda i : map(lambda j : j , i) , graph)\r\n     \r\n    """ Add all vertices one by one to the set of intermediate\r\n     vertices.\r\n     ---> Before start of a iteration, we have shortest distances\r\n     between all pairs of vertices such that the shortest\r\n     distances consider only the vertices in set \r\n    {0, 1, 2, .. k-1} as intermediate vertices.\r\n      ----> After the end of a iteration, vertex no. k is\r\n     added to the set of intermediate vertices and the \r\n    set becomes {0, 1, 2, .. k}\r\n    """\r\n    for k in range(V):\r\n \r\n        # pick all vertices as source one by one\r\n        for i in range(V):\r\n \r\n            # Pick all vertices as destination for the\r\n            # above picked source\r\n            for j in range(V):\r\n \r\n                # If vertex k is on the shortest path from \r\n                # i to j, then update the value of dist[i][j]\r\n                dist[i][j] = min(dist[i][j] ,\r\n                                  dist[i][k]+ dist[k][j]\r\n                                )\r\n    printSolution(dist)\r\n \r\n \r\n# A utility function to print the solution\r\ndef printSolution(dist):\r\n    print "Following matrix shows the shortest distances\\\r\n between every pair of vertices"\r\n    for i in range(V):\r\n        for j in range(V):\r\n            if(dist[i][j] == INF):\r\n                print "%7s" %("INF"),\r\n            else:\r\n                print "%7d\\t" %(dist[i][j]),\r\n            if j == V-1:\r\n                print ""\r\n \r\n \r\n \r\n# Driver program to test the above program\r\n# Let us create the following weighted graph\r\n"""\r\n            10\r\n       (0)------->(3)\r\n        |         /|\\\r\n      5 |          |\r\n        |          | 1\r\n       \\|/         |\r\n       (1)------->(2)\r\n            3           """\r\ngraph = [[0,5,INF,10],\r\n             [INF,0,3,INF],\r\n             [INF, INF, 0,   1],\r\n             [INF, INF, INF, 0]\r\n        ]\r\n# Print the solution\r\nfloydWarshall(graph);\r\n# This code is contributed by Nikhil Kumar Singh(nickzuck_007)	f
186	1	What does __getitem__ in a class allow us to use?	- iteration\r\n- slicing\r\n- reverse iteration\r\n- random.choice	f
187	2	What is the difference between __str__ and __repr__?	def __str__(self): - meant to be human readable\r\ndef __repr__(self): - mean to represent the object and be unambiguous, usually as the constructor: for a Vector class, would be:\r\n   \r\ndef __repr__(self):\r\n    return "Vector({!r}, {!r})".format(self.x, self.y)\r\n    OR\r\n    return "Vector(%r, %r)" % (self.x, self.y)\r\n\r\n\r\nContainers use __repr__ of elements when __str__ is called on container.	f
188	2	C: Method to find a given item x in a linked list. Head is a List *, x's data type is item_type	List *search_list(List *l, item_type x)\r\n{\r\n  if (l == NULL) return(NULL);\r\n\r\n  if (l->item == x)\r\n    return(l);\r\n  else\r\n    return search_list(l->next, x);\r\n}	f
189	2	C: Method to insert a given item x into a linked list. Head is a List *, x's data type is item_type	void insert_list(List **l, item_type x) {\r\n  List *p;\r\n\r\n  p = malloc(sizeof(List));\r\n  p->item = x;\r\n  p->next = *l;\r\n  *l = p;\r\n}	f
190	2	C: Method to return the nth item from the end of a linked list.	int value_n_from_end(node_t *head, int n) {\r\n  if (n < 1 || head == NULL) {\r\n    printf("Cannot get nth item from end.");\r\n    exit(EXIT_FAILURE);\r\n  }\r\n\r\n  node_t *current = head;\r\n  node_t *match = head;\r\n\r\n  for (int i = 0; i < n && current; ++i) {\r\n    current = current->next;\r\n  }\r\n\r\n  if (i != n) {\r\n    printf("List is too short to get nth item from end.");\r\n    exit(EXIT_FAILURE);\r\n  }\r\n\r\n  while (current) {\r\n    current = current->next;\r\n    match = match->next;\r\n  }\r\n\r\n  return match->val;\r\n}	f
191	1	How many subsets are there in n items?	2^n	f
192	2	Python: Given an array of non negative numbers and a total, is there subset of numbers in this array which adds up to given total.	"""\r\n* Time complexity is O(input.size * total_sum)\r\n* Space complexity is O(input.size*total_sum)\r\n"""\r\n\r\ndef subset_sum(sequence, sum_value):\r\n    cols = sum_value + 1         # Plus 1 for 0 valued col.\r\n    rows = len(sequence) + 1     # Plus 1 for 0 valued row.\r\n    T = [[False for _ in range(cols)] for _ in range(rows)]\r\n\r\n    for row in range(rows):\r\n        T[row][0] = True\r\n\r\n    for index_i in range(1, rows):\r\n        for index_j in range(1, cols):\r\n            if index_j >= sequence[index_i - 1]:\r\n                T[index_i][index_j] = T[index_i - 1][index_j] or T[index_i - 1][index_j - sequence[index_i - 1]]\r\n            else:\r\n                T[index_i][index_j] = T[index_i - 1][index_j]\r\n\r\n    return T[rows - 1][cols - 1]\r\n\r\n\r\nif __name__ == '__main__':\r\n    sequence = [2, 3, 7, 8]\r\n    assert True == subset_sum(sequence, 11)	f
193	1	What is a contiguously-allocated structures, and give examples.	Contiguously-allocated structures are composed of single slabs of memory, and include arrays, matrices, heaps, and hash tables.	f
194	1	What are linked data structures and give examples.	Linked data structures are composed of distinct chunks of memory bound together by pointers, and include lists, trees, and graph adjacency lists.	f
195	1	What are some benefits of arrays?	- Constant-time access given the index\r\n- Space efficiency\r\n- Memory locality	f
196	1	Why is memory locality important?	Physical continuity between successive data accesses helps exploit the high-speed cache memory on modern computer architectures.	f
197	1	What are some advantages to linked lists over arrays?	- Overflow on linked structures can never occur unless the memory is actually full.\r\n- Insertions and deletions are simpler than for contiguous (array) lists.\r\n- With large records, moving pointers is easier and faster than moving the items themselves.	f
199	2	Given two strings str1 and str2, find the minimum number of edits (edit one character to another, delete char from str1 or delete char from str2) to change str1 to str2.	"""\r\n* DP Runtime : O(len(str1) * len(str2))\r\n"""\r\n\r\ndef min_edit_distance(str1, str2):\r\n    rows = len(str2) + 1\r\n    cols = len(str1) + 1\r\n    T = [[0 for _ in range(cols)] for _ in range(rows)]\r\n\r\n    for j in range(cols):\r\n        T[0][j] = j\r\n\r\n    for i in range(rows):\r\n        T[i][0] = i\r\n\r\n    for i in range(1, rows):\r\n        for j in range(1, cols):\r\n            if str2[i - 1] == str1[j - 1]:\r\n                T[i][j] = T[i - 1][j - 1]\r\n            else:\r\n                T[i][j] = 1 + min(T[i - 1][j - 1], T[i - 1][j], T[i][j - 1])\r\n\r\n    print_edits(T, str1, str2)\r\n\r\n    return T[rows - 1][cols - 1]\r\n\r\n\r\nif __name__ == '__main__':\r\n    str1 = "azced"\r\n    str2 = "abcdef"\r\n    expected = 3\r\n    assert expected == min_edit_distance(str1, str2)\r\n    assert expected == min_edit_distance(str2, str1)	f
200	1	Codeless question: Write a function to find the middle node of a singly-linked list.	How would you do it?	f
201	1	Codeless question: Write a function to compare whether two binary trees are identical. Identical trees have the same key value at each position and the same structure.	How?	f
202	1	Codeless quesiton: Write a program to convert a binary search tree into a linked list.	How would you do it?	f
203	1	Codeless Question: You are given a search string and a magazine. You seek to generate all the characters in search string by cutting them out from the magazine. Give an algorithm to efficiently determine whether the magazine contains all the letters in the search string.	How would you do it?	f
204	1	Codeless question: Give an algorithm for finding an ordered word pair (e.g., “New York”) occurring with the greatest frequency in a given webpage. Which data structures would you use?	You could use a hash table, creating or updating an entry for each pair. \r\nKeep track of max_frequency and most_frequent_phrase.\r\nJust increment the count, and when you see the new count is > than max_frequency, update max_frequency and most_frequent_phrase	f
205	1	Codeless question: Given a set of n numbers, how do you find the pair of numbers that have the smallest difference between them?	Sort them: Once the numbers are sorted, the closest pair of numbers must lie next to each other somewhere in sorted order. Thus, a linear-time scan through them completes the job, for a total of O(n log n) time including the sorting.	f
206	1	Codeless question: Are there any duplicates in a given set of n items?	This is a special case of the closest-pair problem, where we ask if there is a pair separated by a gap of zero. The most efficient algorithm sorts the numbers and then does a linear scan though checking all adjacent pairs.	f
207	1	Codeless question: Given a set of n items, which element occurs the largest number of times in the set? Bonus: How do you find out how many times some element k appears?	If the items are sorted, we can sweep from left to right and count them, since all identical items will be lumped together during sorting.\r\n\r\nTo find out how often an arbitrary element k occurs, look up k using binary search in a sorted array of keys. Then use binary search in each direction to find where that run of the number begins and ends.	f
208	1	Codeless question: Give an efficient algorithm to determine whether two sets (of size m and n, respectively) are disjoint.	The small set can be sorted in O(m log m) time. We can now do a binary search with each of the n elements in the big set, looking to see if it exists in the small one. The total time will be O((n + m) log m).\r\n\r\nThis is better than sorting the larger array or sorting both sets and going through the list.	f
209	2	Python: Function that reads file numbers.txt and outputs numbers-mult.txt where each number in numbers.txt is multiplied by its line number.	# don't use os.linesep\r\n\r\ndef main():\r\n    input_file = "numbers.txt"\r\n    output_file = "numbers-mult.txt"\r\n\r\n    output = []\r\n\r\n    with open(input_file, "r") as input_handle:\r\n        for line_number, line in enumerate(input_handle, 1):\r\n            output.append(line_number * int(line.rstrip()))\r\n\r\n    output_handle = open(output_file, "w")\r\n    output_handle.write('\\n'.join(str(n) for n in output))	f
210	1	What is a uniform distribution?	When a known finite number of outcomes are equally likely to occur. When graphed as a histogram of occurrences, it's a flat line. N items each have 1/n probability.	f
211	1	What is a normal distribution?	The standard normal probability density function has the famous bell shape that is known to just about everyone.	f
212	1	What is an n-gram?	A set of N sequential words appearing together.	f
213	1	What's the maximum unsigned number you can represent with 9 bits?	511	f
214	1	Whats the average height of a binary search tree after n insertions?	2 ln n\r\nAbout 39% taller than a perfectly balanced BST	f
215	1	What is the runtime of randomized quicksort?	Theta(n log n) time on any input, with high probability.	f
216	2	No answer: Write a function to find the square root of a number within the tolerance of 0.0001	?	f
217	2	Alter a binary search function to find the start and end indexes of the incidences of a number k in a sorted list.	Alter this:\r\n\r\n\r\nint binary_search(item_type s[], item_type key, int low, int high)\r\n{\r\n    int middle; /* index of middle element */\r\n\r\n    if (low > high) return (-1); /* key not found  - replace with return low instead of -1\r\n\r\n    middle = (low+high)/2;\r\n\r\n    if (s[middle] == key) return(middle); // delete\r\n\r\n    if (s[middle] > key)\r\n        return( binary_search(s,key,low,middle-1) );\r\n    else\r\n        return(binary_search(s,key,middle+1,high) );\r\n}	f
218	2	Codeless question: If you are given a million integers to sort, what algorithm would you use to sort them? How much time and memory would that consume?	?	f
219	2	Codeless question: Describe advantages and disadvantages of the most popular sorting algorithms.	?	f
220	2	Codeless: Implement an algorithm that takes an input array and returns only the unique elements in it.	?	f
221	2	Codeless: You have a computer with only 2Mb of main memory. How do you use it to sort a large file of 500 Mb that is on disk?	?	f
222	1	Python: Default arguments are okay to use with the following caveat.	Do not use mutable objects as default values in the function or method definition.\r\n\r\nLists are not ok.	f
223	2	Python: Give an example of a conditional expression.	x = 1 if cond else 2	f
224	2	Python: break this string 'a/b/c' into a list of ['a', 'b', c']	'a/b/c'.split('/')	f
225	2	Python: split a word or sentences into characters.	list('some words')	f
226	1	What's the difference between foo.sort() and sorted(foo) where foo is a list?	foo.sort() changes the list to its sorted state\r\nsorted(foo) doesn't change foo, just returns a sorted list.	f
227	1	Can you sort a tuple?	Yes, using sorted(foo)\r\nbut not with foo.sort()	f
232	1	What's the probability of getting heads twice? P(HH)	1/4 \r\n= 1/2 * 1/2	f
233	1	What's the probability of getting heads, tails, heads? P(HTH)	1/8 \r\n= 1/2 * 1/2 * 1/2\r\nthe ordering of HTH doesn't matter. It could be TTH or HHH or TTT, they are tall the same.	f
234	1	What's the probability of getting heads 200 times in a row?	(1/2)^200	f
235	1	What's the Probability of getting head, tails or tails, heads? P(HT U TH)	(1/2 * 1/2) + (1/2 * 1/2) = 2/4 = 1/2	f
236	1	What's the probability of getting exactly 3 heads in 8 flips?	56/256 = 7/32\r\n\r\n(8 choose 3)/2^8	f
237	1	You have 26 letters in an alphabet. How many ways you can arrange 3 letters from that alphabet where repeated letters is OK?	26*26*26 = 26^3 = 17,576	f
238	1	You have 26 letters in an alphabet. How many ways you can arrange 3 letters from that alphabet without repeating a letter?	26*25*24 = 26 permute 3 = 15,600	f
239	1	Given an alphabet of 26 letters, how many times you can you choose 3 letters, if ordering of the letters doesn't matter?	26*25*24 / 3! = 2600	f
240	1	What is 0! ?	1	f
241	1	There are 4 people. How many ways can they shake each other's hands without shaking the same person's hand twice?	6\r\n= 4 choose 2\r\n= 4 * 3 / 2	f
242	2	Right-propagate the rightmost 1-bit, producing all 1's if x = 0 (e.g., 01011000 01011111):	x |= (x - 1)	f
243	2	Isolate the right-most bit in x.	x & ~(x - 1)	f
244	2	How would you swap 2 integers with no temporary variables and no bitwise operations?	a = a + b\r\nb = a - b\r\na = a - b	f
245	1	What is P?	The set of all problems solvable in polynomial time.	f
246	1	What is EXP?	The set of all problems solvable in exponential time.	f
247	1	What is R? (not real numbers)	The set of problems solvable in finite time.	f
248	1	Is the Halting Problem in R?	No.	f
249	1	What does NP mean? What is an NP algorithm?	NP is the set of decision problem solvable in non-deterministric polynomial time. An NP problem can be solved by a lucky algorithm that magically always finds a yes decision. NP problems can be checked in polynomial time.	f
250	1	What makes a problem NP-Complete?	If x is an element of NP and of NP-hard. Np-Complete is the narrow intersection of NP and NP-hard.	f
251	1	What is Fib(0) ?	0	f
253	1	What is Fib(3) ?	2	f
254	1	What is Fib(2) ?	1	f
255	1	What is a PTAS?	Polynomial-time approximation scheme.	f
256	1	What is a pointer?	A memory address stored in memory.	f
257	1	Give 2 examples of common data structures that contain reference cycles.	- Doubly-linked lists\r\n- Trees with parent and child pointers	f
258	1	What is a weak reference in Python?	A weak reference to an object does not affect its reference count. \r\nWhen the only remaining references to a referent are weak references, garbage collection is free to destroy the referent and reuse its memory for something else. A primary use for weak references is to implement caches or mappings holding large objects, where it’s desired that a large object not be kept alive solely because it appears in a cache or mapping.	f
259	1	How does garbage collection work in CPython?	CPython uses reference counting and generational garbage collection. There are 3 age stages where objects live in memory. They all start in the "nursery", stage0, then if they survive a garbage collection, they are moved to stage1, the oldest objects that continue to survive in stage1 are promoted to stage2. The gc module has thresholds 700, 10, 10 for each stage. In order to decide when to run, the collector keeps track of the number object allocations and deallocations since the last collection. When the number of allocations minus the number of deallocations exceeds threshold0, collection starts. If generation 0 has been examined more than threshold1 times since generation 1 has been examined, then generation 1 is examined as well. Similarly, threshold2 controls the number of collections of generation 1 before collecting generation 2.	f
260	1	What is reference counting?	RC is a method of garbage collection. The runtime keeps track of references to an object by manipulating the reference count on each assignment and delete (del), and when the reference count reaches 0 it means the object is practically unreachable. When the next collection runs, the object's memory will be reserved to allocate for new objects.	f
261	1	What is a finalizer in Python?	A finalizer is a destructor, named __del__. __del__() is run when the runtime is about to destroy the object.	f
262	1	What are 2 advantages of reference counting?	- easy to implement\r\n- collects garbage incidentally without large pauses in execution.	f
263	1	What are 2 disadvantages of reference counting?	- it cannot collect circular references\r\n- manipulating reference counts at each assignment is very slow.	f
264	1	What is cyclic garbage collection?	Detects and removes cycles unreachable by the program.	f
265	1	How is garbage collection done in PyPy?	The GC implementation can be chosen at runtime. It's pluggable.\r\nPyPy uses mark and sweep, and generational gc optimization. Marked objects are promoted from the nursery to an older generation.\r\nPyPy uses incremental garbage collection, where major collection is split into multiple passes, each lasting only a few milliseconds.	f
266	1	What is a pointer?	A pointer is a memory address stored in memory.	f
267	1	How does mark and sweep work?	(In Java) Perform a DFS on the graph of references to objects. This graph can have multiple roots. Each root is a reference that the program can access directly, such as a variable. Traverse the graph, setting a mark bit in each object. The sweep phase causes unmarked memory to be linked together in a list, so that memory can be reallocated. Sometimes this also triggers compaction, which moves used objects adjacent to each other in memory. The side effect of this is that free memory is also adjacent to free memory so large blocks can be allocated.	f
268	1	What is copying garbage collection (stop and copy)?	Heap memory is split into 2 partitions: an old space and a new space. Find live objects by DFS of their reference graph, and move live objects into the new space. The new space is now called the old space. Unreachable objects are simply left in the old space to be overwritten the next time collection occurs. The movement of objects implicitly compacts the objects. Disadvantage: you can only use half of the heap space.	f
308	1	What is the limiting factor of compression?	For lossless compression, it's entropy. For lossy compression, it's our acceptance with the amount of loss.	f
309	1	What is LZ* compression based on?	Cataloging the positions and lengths of redundant patterns and combining the values with a dictionary.	f
1101	1	insert (binary heap)	O(log N)	f
269	1	How could you implement an LRU cache?	A fast lookup table, like a hash table or binary tree, and a linked list of items by use. When you access or add an item, you delete it from the linked list and add it to the head of the list.  Then to prune, traverse the linked list and remove trailing elements, and delete them from the storage (tree or hash table).\r\nYou can also use a splay tree, since it moves accesses to the root. To prune items, somehow find and remove the leaves, since the number of leaves will be about n/2.	f
270	1	What is a direct mapped cache?	It's a type of cache used in the CPU, where the lower order bits of a given memory address are used modulo the number of cache lines to place or lookup in the cache. Collisions are treated as overwrites.	f
271	1	What is a fully-associative cache?	It's a type of cache used in the CPU, where lookups are done on all cache lines in parallel to determine a hit or miss.\r\n\r\nThis requires a very large number of comparators that increase the complexity and cost of implementing large caches. Therefore, this type of cache is usually only used for small caches, typically less than 4K.	f
272	1	Disadvantage of a fully-associative cache?	- expensive due to parallel checks\r\n- complexity of implementing this scheme	f
273	1	How do some processors handle caching for data and instructions?	There will be a slightly slower (3-4 clocks latency) separate cache for data.	f
275	1	What is an N-way set associative cache?	A Set-Associative cache scheme is a combination of Fully-Associative and Direct Mapped caching schemes. A set-associate scheme works by dividing the cache SRAM into equal sections (2 or 4 sections typically) called cache ways. The cache page size is equal to the size of the cache way. Each cache way is treated like a small direct mapped cache.	f
276	1	Describe the memory hierarchy of a Core i7 processor.	Inside of each core is a 32 kB L1 instruction cache, a 32 kB L1 data cache (it's 8-way set associative), and a dedicated 256 kB L2 cache (also 8-way set associative). \r\nOutside of the cores is the L3, which is much larger at 8 MB and smarter (16-way associative) than the L2s.	f
277	1	When is entropy at its maximum?	When all outcomes are equal.	f
278	1	As predictability increases, what happens to entropy?	It decreases.	f
279	1	As it relates to compression, as entropy increases, does our ability to compress increase?	No, it decreases.	f
280	1	What does low entropy mean?	Very predictable.	f
281	1	What is entropy?	The minimum number of bits needed to represent x number of states. Also, information we don't know.	f
282	1	What is a Caesar cipher?	The cipher created by shifting/rotating an alphabet by a specific number previously agreed upon.	f
283	1	What is a polyalphabetic cipher?	A cipher where each letter is shifted based on the shifts of letters in a key word.	f
284	1	What is the entropy of n equally likely outcomes?	log(n)	f
285	1	Is GET idempotent?	Yes	f
286	1	Is PUT idempotent?	Yes.	f
287	1	Is POST idempotent?	No.	f
288	1	Is DELETE idempotent?	According to the REST spec, yes, but it's up to the developer to conform to that. It can be achieved by using a deleted flag for a resource instead of completely removing the resource.	f
289	1	What is idempotent?	The property that a method has side-effects of making more than one identical requests is the same as for a single request.	f
290	1	What is HMAC?	HMAC is a keyed-hash message authentication code used to provide a checksum for a message, sent along with the message to provide confidence that the message has not been tampered.	f
291	1	What is a MAC?	MAC is a message authentication code used to provide a checksum for a message, sent along with the message to provide confidence that the message has not been tampered.	f
292	1	How does RSA work?	It's a public/private key cryptography method. The public key can be used to encrypt a message into ciphertext that only the owner of the key can decrypt. The owner of the key uses their secret key to encrypt messages, and their secret key to decrypt messages encrypted with their public key.	f
293	1	What is the phi function?	It answers the number of integers <= n that do not share a common factor with n.	f
294	1	What is phi(n) if n is prime?	n - 1	f
295	1	What is the gcd of a number a and prime p when p is prime?	1, unless a is a pseudoprime (Carmichael number)	f
296	1	What does SHA stand for?	One of the family of Secure Hashing Algorithms.	f
297	1	What is the largest output size of SHA-3?	512 bits	f
298	1	What are desirable properties of one-way functions?	- collision resistant\r\n- target collision resistant\r\n- non-malleable	f
299	1	If a one-way function is collision-resistant, does that mean it's also target collision-resistant?	Yes.	f
300	1	If a one-way function is target collision-resistant, does that mean it's also collision-resistant?	No.	f
301	1	What is symmetric key encryption?	There is a known encryption function, and one key is used to encrypt and decrypt. The key has to be shared between 2 parties.	f
302	1	How does Diffie-Hellman key exchange work?	2 parties agree on a G and a modulus p, and each party comes up with a number. One party does G^a and the other G^b. They pass this information. One party A computes the key from B as B^a mod p. B computes A^b mod p to get the key.	f
303	1	Is Diffie-Hellman key exchange perfect?	No. A man in the middle can intercept one side, and communicate with parties A and B independently.	f
304	1	How is RSA (using product of large primes) better than using NP-Complete algorithms for encryption?	NP-Complete algorithms are hard in the worst case, but can be sometimes solved in linear time in the average case. Compositing the product of large primes is hard in the average case.	f
305	1	What is Vigenere cipher?	Improvement on Caesar cipher. Letters are shifted based on a shifted dictionary. "Polyalphabetic cipher"	f
306	1	What is a one-time pad encryption?	The "perfect" simple encryption scheme. Pad/key is the same size as the message being encrypted. The key is randomly generated and xored against the plain text. Or key used to determine the amount each letter should be shifted.	f
307	1	What is block size in cryptography?	Symmetric key ciphers are generally divided into stream ciphers and block ciphers. Block ciphers operate on a fixed length string of bits. The length of this bit string is the block size. Both the input (plaintext) and output (ciphertext) are the same length; the output cannot be shorter than the input – this is logically required by the Pigeonhole principle and the fact that the cipher must be invertible – and it is simply undesirable for the output to be longer than the input.	f
310	1	What is LZMA?	It's a variant of LZ77 that uses Markov chains. It's used in the 7z compression algorithms used in 7-zip.	f
311	1	What is DEFLATE?	It's an lossless compression algorithm based on LZ77 used in Gzip, WinZip, and mod_deflate, which is bundled with Apache web server for automated gzip compression of HTTP served content. It uses LZ77 and Huffman coding.	f
312	1	How does LZ77-based compression work?	LZ77 is a dictionary encoding algorithm, which is a statistical encoding algorithm. Compression in the LZ77 algorithm is based on the notion that strings of characters (words, phrases, etc.) occur repeatedly in the message being compressed.\r\n\r\nThe input is partitioned into 2 segments: a search buffer and a look-ahead buffer. The search buffer maxes out at 32KB. Starting with one character in the LA buffer, it looks back in the search buffer to find a copy of the symbol. If one is found, it looks at the second symbol of the LA buffer to see if it also matches the predecessor. Using this method, it can detect long phrases of symbols and encode them as one unit.\r\n\r\nThis process implicitly creates a rolling statistical probability for each symbol/phrase.	f
313	1	What is Huffman encoding?	Huffman encoding algorithm analyzes the occurrence of individual symbols and creates a binary tree where the common symbols are closest to the root, using fewer bits to encode, and less common/rare symbols have longer paths on the tree, with longer encodings to accommodate. By traversing the tree, from root to leaf, and keeping track of 1 or 0 at each node, we can determine the encoding of the symbol.	f
314	1	What is the primary factor of compression?	Probability of redundant portions of input.	f
315	1	How can you maximize compression?	By deeply analyzing the given input to reduce redundancy as much as possible.	f
316	1	What compression scheme uses Burrows-Wheeler transform?	BZip2	f
317	1	What is the Burrows-Wheeler transform?	It's a compression method involving the sorting of all possible rotations of the input text into lexicographic order. Take as output the last column and the index of the row that the original text appears in. \r\n\r\nTo decode, take the single column and repeatedly add the final columns characters to each of the rows, sorting each time. Once you've reached the length of the column's height, use the index to find the output string.	f
318	1	For Gzip in web servers, what is the usual setting?	6	f
319	1	What is the min and max compression settings in command line gzip?	0-9	f
320	1	How can you make JSON better compressable with Gzip?	Transpose from multiple mini-dicts into one dict with arrays as the values. This allows the items in an array to fit within the 32KB search buffer common to LZ-based compression.	f
321	1	What are Dense Codes?	A way to put symbols or words into a dictionary or array, and use the indices as the values in the text to save space so that words are not repeated.	f
322	1	What is the LZ in LZ compression?	Lempel-Ziv	f
323	1	What is OS hardware virtualization?	The abstraction of heterogeneous hardware provided by the operating system, to hide the details of interfacing with various hardware so that they share a common interface for that type.	f
324	1	What is a process?	An instance of an executing program consisting of an address space and one or more threads of control. It has restricted rights. It owns a region of memory. It owns file descriptors, file system context. It encapsulates one or more threads sharing the process' resources. It is isolated from other processes.	f
325	1	What is a context switch?	The copying out and in of register state to switch from running one process to running another.	f
326	1	What is the scheduler?	The scheduler manages the priorities of user and OS processes.	f
327	1	What causes operating systems to crash most of the time?	Device drivers. They are in the kernel and very low level. They have access to all the hardware, including memory. They are written by authors outside of the operating system.	f
328	1	What is a process VM?	A virtual environment that supports the execution of a single program. This is provided by an operating system.	f
329	1	What is a system VM?	A virtual environment that supports the execution of an entire operating system and its applications.	f
330	1	How does the OS abstract the environment for a process?	Each process thinks it has all the memory and CPU time, and thinks it owns all devices.	f
331	1	What is fault isolation?	Processes are unable to directly impact other processes. Bugs can't crash the whole machine.	f
332	1	What is a thread?	A single, unique execution context.	f
333	1	What's the maximum address in memory for a 32 bit processor?	2^32 - 1	f
334	1	What is the execution sequence for a program?	- Fetch instruction\r\n- Decode\r\n- Execute (perhaps using ALU and writing result to a register)\r\n- Write results to registers or memory\r\n- Increment program counter\r\n- Repeat	f
335	1	What does the program counter point to?	An address in memory that contains the current instruction.	f
336	1	What is the stack pointer?	A register that holds the address of the top of the stack portion of a process' memory.	f
337	1	What is the heap pointer?	A register that holds the address of the top of the heap portion of a process' memory.	f
338	1	What is multiprogramming?	Making one processor appear as multiple processors, each handling one process each.	f
339	1	What triggers a context switch?	Timer interrupt, hardware interrupt, I/O where we're waiting for a read or write to complete (OS doesn't want to waste time waiting), voluntary yield.	f
340	1	What is dual-mode operation?	Hardware provides at least 2 modes: user mode and kernel (aka: supervisor, protected) mode.	f
341	1	How does the OS run a program?	It does an exec from kernel mode (system mode 1). We go to system mode 0, user mode. When the program exits, we switch back to kernel mode.	f
342	1	How does a user program interact with the kernel?	It makes a system call, and the kernel takes over, completes the action, and the kernel returns to the process (back to user mode).	f
343	1	What happens when the hardware needs something to happen?	It does an interrupt, and the kernel takes control, switches the process, and once hardware task is complete, does a return from interrupt back to user mode.	f
344	1	What happens when a program makes an exception?	The program terminates, and switches to kernel mode.	f
345	1	What is base and bound?	It's a memory addressing restriction where a processes are only allowed access to the memory between a base address and the bound + base addresses. Each process has its own base and bound. A drawback is you don't get address 0. Address translation fixes this.	f
436	1	What is NTP?	Network time protocol	f
346	1	How does the OS know how to handle an interrupt?	It keeps an interrupt vector in the memory of the OS. Each interrupt type is mapped to an address to execute. They are just pointers to code in the OS.	f
347	1	What is the difference between PC and uPC?	PC is the program counter for the current process. uPC is the PC of the user process we will return to once an interrupt or other OS process switches context.	f
348	1	How are base and bound enforced?	They are stored in registers. Access is restricted by the hardware.	f
349	1	How does x86 do segments and stacks?	Each process' individual segments (heap, stack, code, static data) get their own base and bound. They don't even need to be adjacent in memory and their location is hidden by memory addressing.	f
350	1	When a process forks, what happens?	The process is paused, and a complete copy is made: code, stack, heap, data, program counter and registers.\r\nThe child and parent resume with returning from fork syscall.	f
351	1	What does fork() return?	It returns the child process id to the parent, and 0 to the child. < 0 if error.	f
352	1	What does wait() do?	Causes the parent process to pause until the child terminates.	f
353	1	What does exec() do?	It's a system call to change the currently running program to something else.	f
354	1	What comes back from wait()?	on success, returns the process ID of the terminated child; on error, -1 is returned.	f
355	1	What is a signal?	A system call to send a notification to another process.	f
356	1	In a child process, what can you do with fork and then exec?	Create a completely new process and then exit.	f
357	1	What is a shell?	A job control program. It allows a programmer to create and manage a set of programs to do some task.	f
358	1	What is a microsecond? Also known as μs	1 millionth of a second.	f
359	1	What is a nanosecond?	1 billionth of a second. ns	f
360	1	What is a picosecond?	A trillionth of a second.	f
361	1	How does the kernel handle reads and writes?	It buffers reads so they can be handled as a stream in your program. Writes are buffered and are not written until the kernel flushes the buffer.	f
362	1	What's the difference between the fread, read, fwrite, write I/O calls?	The ones with f are high-level I/O and streamed and buffered by the kernel. The non-f are low-level I/O.	f
363	1	When a system call is made, where are parameters stored?	In registers.	f
364	1	What is a socket?	It's an abstraction of a network I/O queue.  It's a method of communication where a producer writes to one side, and a consumer reads from the other side. It's similar to writing and reading a file, but no file is involved.	f
365	1	What sockets are in modern use?	Local sockets to local machine, called UNIX sockets, and TCP/IP and UDP/IP.	f
366	1	What is the GIL?	It's the Global Interpreter Lock. It's is a part of CPython. It ensures only one thread runs in the interpreter at once. Having the GIL simplifies many low-level details (memory management, callouts to C extensions, etc.)	f
367	1	When is the GIL released?	During I/O (disk IO, network IO, output to display) including when a thread uses sleep.	f
368	1	What is a "tick" in CPython?	Approximately 1 machine instruction.	f
369	1	What happens every 100 "ticks" in the CPython interpreter?	A thread check occurs during which the thread releases the GIL then attempts to reacquire it. Other Python threads will contend for the the GIL. This is no longer the case in 3.4.	f
370	1	What is a lock in CPython?	It's a binary semaphore. It's not a mutex lock.	f
371	1	What happens when the heap gets too large?	It does a page fault, and the kernel will allocate more memory.	f
372	1	What happens when the heap and stack meet in memory?	A guard page is hit and the process is killed.	f
373	1	Where is information about a process stored?	In a PCB (process control block).	f
374	1	Where is information about a thread stored?	In a TCB (thread control block).	f
375	1	What do multiple threads in the same process share?	Heap, file descriptors, code, static data.	f
376	1	What do threads in a process NOT share?	Registers and stack.	f
377	1	What can happen with thread stacks if one goes into a deep recursion?	One thread's stack can grow into another thread's stack and write over it. A guard page can help to protect from that.	f
378	1	What can cause a thread to give control back to the dispatcher?	Thread returns control voluntarily (yield, requesting I/O (which blocks), wait for signal from another thread) or gets preempted by an interrupt.	f
379	1	How long does it take to do a process context switch?	3-4 microseconds.	f
380	1	How long does it take to perform a thread context switch?	100ns	f
381	1	How often do context switches happen?	Every 10-100 ms.	f
382	1	Context switch time increases sharply with the size of what? (by 100x or more.)	The working set - the subset of memory used by the process in a time window. Cache etc.	f
383	1	What happens in a system call to get the OS to switch to kernel mode?	A trap.	f
384	1	How many threads should you run per process?	One per core.	f
385	1	How is concurrency accomplished?	By multiplexing CPU time.	f
386	1	What's the difference between parallelism and concurrency?	Concurrency means running multiple blocks of instructions independently. Parallelism means running instructions at the same time, as on multiple cores at once.	f
387	1	What is oversubscription?	Spawning more threads than available cores.	f
388	1	What is a race condition?	When the outcome of a deterministic procedure becomes non-deterministic based on differences in subprocess timing.	f
389	1	What can you put in place to exclusively use a resource without another process interfering?	A mutex, or even better, a lock guard.	f
391	1	How do you use a mutex in Python?	import threading\r\n\r\nlock = threading.Lock()\r\n\r\n[first process]\r\nglobal lock\r\nlock.release()\r\n...\r\n[other process]\r\nglobal lock\r\nlock.acquire() // attempts to get access, waits if it can't	f
392	1	What does a future do?	Allows us to receive a return value from a function in a child thread.	f
393	1	What is a promise?	A promise to send a parameter to a child thread's function later.	f
394	1	What is livelock?	It occurs when multiple processes are attempting to deal with the current state, but neither makes progress. This can happen when a system is attempting to resolve a deadlock situation but another or the same process continue to trigger it.\r\nStarvation is another example.	f
395	1	How long does a terminated process stay in the terminated state?	Until the parent process does a wait to receive its exit code.	f
396	1	In Python, what can you use to fork a process?	The multiprocessing module. It supports process Pool and Process for making a pool of worker processes or forking temporary subprocesses.	f
397	1	What does the concurrent.futures module offer?	ThreadPoolExecutor\r\nProcessPoolExecutor\r\nExecutor objects\r\nFuture objects	f
398	1	What is an interrupt?	A hardware-invoked context switch. The interrupt handler always runs immediately.	f
399	1	What happens during an interrupt?	The currently running process' state is saved. We switch to kernel mode, the interrupt handler runs, and once its complete, the system goes back to user mode and the process continues.	f
400	1	What really happens when you fork a process?	A fork doesn't copy everything, it just duplicates the page table pointers, which are all set at read-only. Called copy-on-write. Once you write to memory, then it copies the state.	f
401	1	What is multiprocessing?	Parallel execution on multiple cores.	f
402	1	What does a PCB contain?	Everything about a process:\r\n- status\r\n- register state (when not in ready state)\r\n- PID, User, Executable, Priority\r\n- Execution time\r\n- Memory space, translation	f
403	1	What is special about an interrupt handler?	It disables interrupts and runs to completion.	f
404	1	What are the five states a process can be in?	- new (when being created)\r\n- ready\r\n- running\r\n- waiting (for I/O or event coordination)\r\n- terminated (waits for parent process to receive its exit code)	f
405	1	What is the difference between filter() and map()?	Filter uses a function that returns true or false (predicate).\r\nMap uses a function that returns a value.	f
406	1	What is synchronization?	Using atomic operations to ensure cooperation between threads.	f
407	1	What is a critical section?	A block of code that you lock before entering, then unlock when leaving. This creates a mutual exclusion on shared data.	f
408	1	What is the priority inversion problem?	A thread that is busy-waiting for a lock to be released ends up stealing CPU and getting a higher priority than the thread with the lock. SO since the waiting thread gets higher priority, the thread holding the lock can't complete and release the lock.	f
409	1	What is busy-waiting?	One or more threads is using a lot of CPU by continuously checking a value, or test&set() checking and writing a value in wiating for a lock to release, thus stealing CPU from the thread holding the lock.	f
410	1	What is a semaphore?	A semaphore (defined by Dijkstra) is kind of signaling solution for handling concurrency data integrity problems that arise in multi-threaded applications. It has a non-negative integer that supports 2 operations:\r\n- P() [proberen, to test/probe] - atomic operation that waits for semaphore to become > 1, then decrements it by 1 (wait)\r\n- V() [verhogen, to increment] - an atomic operation that increments the semaphore by 1, waking up any P (signal)\r\n\r\nThe initial semaphore value will determine how many threads can run in the critical section at once.	f
411	1	What's another name for a mutual exclusion?	Binary semaphore.	f
412	1	What is a monitor?	A lock and zero or more condition variables for managing concurrent access to shared data.	f
413	1	What should locks and condition variables each be used for?	locks - mutual exclusion\r\ncondition variables - scheduling constraints	f
414	1	What is a condition variable?	A queue of threads waiting for access to something in a critical section.	f
415	1	What is a special feature of condition variables?	It allows sleeping inside a critical section by atomically releasing lock at the time we sleep.	f
416	1	What are the 3 methods on a condition variable?	wait(&lock)\r\nsignal() - signals the next waiting member\r\nbroadcast() - signals all waiting members	f
417	1	What type of scheduling do most modern processors use?	Mesa-scheduling.	f
418	1	What are some things the scheduler tries to accomplish?	- minimize response time\r\n- maximize throughput\r\n- fairness	f
419	1	What is a drawback of context switching?	CPU cache misses as thread comes back from switching and finds the CPU cache doesn't have the values it had before.	f
420	1	What's the convoy effect?	Short processes get stuck behind long processes in a FIFO style ready queue.	f
421	1	What is the round robin scheduling scheme?	Each process gets a time quantum q milliseconds to run. 10-100ms, the q is tunable. Each process runs for that time slice (or until completion if close to done) and then goes back on the ready queue.	f
422	1	What are pros of the round-robin scheduling scheme?	- better for short jobs (they fit in the time slice)\r\n- fair	f
423	1	What is a con of the round-robin scheduling scheme?	Long jobs take longer because context-switching time adds up.	f
424	1	How long does context switching take?	0.1ms - 1ms\r\nIt's roughly 1% overhead.	f
425	1	What is starvation?	When low-priority jobs never get run because there are always higher priority jobs running.	f
426	1	How does a process' priority get changed?	The scheduler utilizes heuristics on interactivity, locking, burst behavior, etc.	f
427	1	What are some methods of avoiding deadlock?	- don't allow waiting for a resource (means a lot of retries)\r\n- make all threads request everything they'll need at the beginning\r\n- force all threads to request resources in a particular order preventing any cyclic uses of resources (so no cycle exists)\r\n- temporarily expand resources when a deadlock is detected	f
428	1	What is the banker's algorithm for preventing deadlock?	- allocate resources dynamically\r\n- evaluate each request and grant if some ordering of threads is still deadlock-free afterward\r\n- do so by pretending the request was granted, then running a simulation to see if a deadlock would occur	f
429	1	How does the banker's algorithm solve the dining lawyers problem?	When you try to grab a chopstick, it's either:\r\n- not the last chopstick\r\n- is last chopstick but someone else will have two afterwards	f
430	1	Does the CPU use virtual addresses or physical addresses?	Virtual addresses	f
431	1	What translates virtual to physical addresses?	The MMU - the memory management unit	f
432	1	What are the four conditions needed for a deadlock?	- mutual exclusion\r\n- hold and wait\r\n- no preemption\r\n- circular wait	f
433	1	How many bits represent an IPv4 address?	32	f
434	1	How many bits represent an IPv6 address?	128	f
435	1	Name some of the protocols used within the TCP/IP application layer.	- http\r\n- https\r\n- ftp\r\n- tftp\r\n- ntp\r\n- irc\r\n- telnet\r\n- smtp\r\n- ssh\r\n- dns\r\n- snmp\r\n- pop3	f
437	1	What are some protocols in the TCP/IP transport layer?	- TCP\r\n- UDP	f
438	1	What are some TCP/IP network layer protocols?	IP - internet protocol\r\nICMP - internet control message protocol\r\nARP - address resolution protocol	f
439	1	What are some TCP/IP network access layer protocols?	- RJ45\r\n- ISDN\r\n- Microwave\r\n- Ethernet\r\n- Wifi\r\n- Fiber optics\r\n- ATM\r\n- RJ48\r\n- Copper cables	f
440	1	What is a PDU?	Protocol data unit\r\n- generic term used to describe the information at a given layer in the TCP/IP stack	f
441	1	What is the PDU for OSI layer 7?	data, determined by what information is being exchanged: text, encrypted text, compressed data	f
442	1	What are the PDUs for the the OSI transport layer?	for TCP, it's called a segment\r\nfor UDP, it's called a datagram	f
443	1	What is the PDU for the TCP/IP internet layer?	packet	f
444	1	What are the 2 PDUs of the OSI Network Access layer?	data link layer: frames\r\nphysical layer: bits	f
445	1	What is the port for DNS?	53	f
446	1	What is the port for telnet?	23	f
447	1	What is the port for ssh?	22	f
448	1	What is the port range for clients?	8000-65535	f
449	1	How many bits are in an ethernet frame?	48 bits, represented as a hexadecimal number.	f
450	1	What does MAC stand for?	medium access control, a sublayer in the data link layer.	f
451	1	What is the PDU and the addressing at the data link layer?	PDU: frame\r\nAddressing: physical (MAC) address	f
452	1	What devices are at the data link layer?	Bridges, switches (multi-port bridge). They inspect frames and forward or not.	f
453	1	What devices are at the Internet/Network layer?	Routers\r\nLayer 3 switches: can be a switch or a router	f
454	1	What is the PDU and the addressing at the Internet/Network layer?	PDU: packet\r\nAddressing IP address	f
455	1	What is the PDU and the addressing at the Transport layer?	PDU: segment\r\naddressing: ports	f
456	1	What devices are at the Transport layer?	Firewalls	f
457	1	What is a socket in HTTP?	The combination of an IP address and a port.	f
458	1	What is involved in the 3 way handshake (TCP)?	SYN=1 - synchronize, gives a Seq number and expects that number + 1 in response\r\nACK=1 - sent by acknowledging server with incremented number, who also sends a SYN=1 and a Seq\r\nSYN=0 ACK=1 and the Seq (incremented number) back to the server\r\n\r\nNow you're talking!	f
459	1	Does Kerberos use symmetric or asymmetric encryption?	Symmetric. It tracks all principals and their keys in its KDC table.	f
460	1	What are the 7 layers of the OSI model?	- application\r\n- presentation\r\n- session\r\n- transport\r\n- network\r\n- data link\r\n- physical	f
461	1	What are the 4 layers of TCP/IP?	- application (application, presentation, session in OSI)\r\n- transport\r\n- internet (network in OSI)\r\n- network access (data link & physical in OSI)	f
462	1	How is an SSL certificate generated by the certificate authority (CA)?	The common name and public key for a given domain name, signed by the certificate authority's secret key.\r\nThe browser can verify the cert with CA's public key.	f
463	1	What is the secure flag on a cookie?	When set on a cookie, it will only be sent on https requests.\r\nWhen not set, cookie will be sent on both http and https requests.	f
464	1	When does a Python multi-threaded program terminate?	The entire Python program exits when no alive non-daemon threads are left.	f
465	1	In Python, if a thread is set to daemon, what happens when the thread sleeps?	If the Python program reaches its end, the thread will be killed even if it's sleeping.	f
466	1	If a thread is a daemon, what happens when you do a join()?	The main thread will wait for it.	f
467	1	What does WebRTC stand for?	Web Real-Time Communication	f
468	1	Give an example of the thread-per-connection pattern.	A web server might spawn a thread per connection, then reuse that thread once the connection ends, or terminate the thread.	f
469	1	Give an example of the thread pool model.	A pool of threads can be maintained in order to quickly provide one as a resource for a database connection.	f
470	2	Fibonacci in Python	def fib(n):\r\n    a, b = 1, 1\r\n    for i in range(1, n):\r\n        a, b = b, a + b\r\n\r\n    return a	f
471	1	What is contained in a packet?	- source IP\r\n- destination IP\r\n- data - some portion of the final payload	f
472	1	What is TLS?	The successor to SSL. All of SSL's versions have been deprecated due to security issues.	f
473	1	What is the purpose of the transport layer?	To allow multiple applications to use one network connection simultaneously.	f
474	1	What is DNS spoofing?	A DNS server is compromised and returns incorrect IP addresses for a some domains.	f
475	1	What does TCP stand for?	Transmission Control Protocol	f
476	1	What is special about TCP?	It manages the sending and receiving of packet data.\r\nIt acknowledges receipt of packets.\r\nIf packets are missing, the source will resend the missing packets.	f
477	1	What is HTTP?	The protocol for client-server communication.	f
478	1	What does UDP stand for?	User Datagram Protocol.	f
479	1	What is the size of a UDP header?	8 bytes	f
480	1	What is the size of a TCP header?	20 bytes	f
481	1	What does ICMP stand for?	Internet Control Messaging Protocol	f
482	1	What does ICMP allow you to do?	Allows devices to communicate and send errors. Can echo to see if a device is on the network.	f
483	1	What does SNMP stand for?	Simple Network Management Protocol.	f
484	1	What does SNMP do?	Gathers info from machines on the network when each box has an SNMP agent installed. Can send a large amount of info about machines, software installed, and machine configuration.	f
485	1	Do you need to establish a connection before sending data via UDP?	No, it's connectionless.	f
486	1	Tell me about the checksum in a UDP packet.	It's a 16-bit checksum. It's only mandatory on IPv6	f
487	1	How many times are packets sent in UDP?	Once.	f
488	1	What is special about UDP?	It's connectionless, packets are only sent once and not re-sent if dropped. Packets may not arrive in the right order, and there is no ordering mechanism to fix on the receiving end. No congestion control.	f
535	1	What is JIT compilation?	JIT compilation, also known as dynamic translation, is compilation done at run-time rather than ahead of time (AOT).	f
489	1	What's special about TCP?	It does a 3-way handshake before data is sent.\r\nDelivery is acknowledged by receiver.\r\nPackets missing within a certain time window are re-requested.\r\nPackets are put in order on receipt.\r\nCongestion control: can delay delivery until network is uncongested.\r\nIPv4 and IPv6: error detection, checksum mandatory.	f
490	1	What does OSI stand for?	Open Systems Interconnect	f
491	1	Why was OSI created?	To solve the interoperability problem of having multiple heterogeneous networks.	f
492	1	Is OSI just a model?	Yes.	f
493	1	What network protocol won the networking wars?	TCP/IP, based on the OSI model.	f
494	1	What happens at the Application level of the OSI model?	This is where applications live and they handle data in many forms.	f
495	1	What happens in the Session layer of the OSI model?	This layer handles configuration of the data:\r\n- encryption\r\n- compression\r\n- translation to and from different character encodings	f
496	1	What happens at the Session layer of the OSI model?	This layer controls the communication's access via:\r\n- login rights\r\n- permissions\r\n- rights\r\n- roles	f
497	1	What happens at the Transport layer of the OSI model?	This layer guarantees end-to-end delivery of data:\r\n- packet ordering\r\n- error detection\r\n- acknowledgements	f
498	1	What happens at the Network layer of the OSI model?	This layer's function is to find the shortest path through the network to the destination network.\r\nDeals with congestion, bandwidth, etc.	f
499	1	What happens at the Data Link layer of the OSI model?	It decides whose turn it is to talk on the network using bus arbitration methods.\r\nIt finds the physical device on the network.	f
500	1	What happens at the Physical layer of the OSI model?	It's the physical network that deals with the physical transmission of electricity through wire:\r\n- cables\r\n- voltages\r\n- frequencies\r\n- connectors\r\n- bits\r\n- transfer rates\r\n- and much more	f
501	1	How does HTTP/2 save bandwidth?	Headers are compressed and do not need to send the same headers in a session if they haven't changed.\r\nServers can send assets referenced in a document without waiting for discrete requests for them.	f
502	1	How does HTTP/2 improve cache breaking?	A server can send updated assets using server push when it recognizes a file has changed.	f
503	1	What is the stream parallelism in HTTP/2?	It's fully multiplexed, so it can use 100-1000 streams in a connection.	f
504	1	Is HTTP/2 binary or textual?	HTTP/2 is a binary protocol.	f
505	1	How are headers and body treated differently in HTTP/2?	They are split into a header frame and a data frame. Multiple requests can be interleaved in a connection, so a request doesn't block.	f
506	1	What is priority in HTTP/2?	Different assets can have different priority so that below the fold content can arrive later.	f
507	1	What is the range of the first octet on a Class A network?	1-126. We don't use 0 or 127.	f
508	1	How many network IDs are there on a Class A network?	2^7 = 128\r\nFirst bit is 0, bits 1-7 are network IDs	f
509	1	How many host IDs are supported on a Class A network?	2^24 = 16 million\r\nThere are 8 bits for the network ID, and the remaining 24 bits are for host IDs.\r\nSo there are 16 million per network.	f
510	1	What is the range of the first octet on a Class B network?	128 - 191	f
511	1	How many network IDs are supported on a Class B network?	2^14 = 16,384\r\nFirst 2 bits are 10, bits 3-16 are network IDs	f
512	1	How many host IDs are supported on a Class B network?	2^16 = 65,536\r\nSo there are 65,536 per network	f
513	1	What is the range of the first octet on a Class C network?	192-223	f
514	1	How many network IDs are supported on a Class C network?	2^21 = 2 million\r\nFirst 3 bits are 110, bits 4-24 are network IDs	f
515	1	How many host IDs are supported on a Class C network?	2^8 = 256\r\nThere are 256 hosts per network	f
516	1	What is a class D network reserved for?	Multicasting	f
517	1	What is unicasting?	Sending a packet from one host to another.	f
518	1	What does a network ID end in?	0	f
519	1	What does a broadcast ID end in?	255	f
520	1	Who does a broadcast address of 255.255.255.255 send to?	All hosts within the network.	f
521	1	What is a directed broadcast?	It's a broadcast to all hosts within another network.	f
522	1	What is a limited broadcast address?	The limited broadcast address is the address formed by setting all 32 bits of the IP address to 1 (255.255.255.255). The limited broadcast address is used when an IP node must perform a one-to-everyone delivery on the local network but the network ID is unknown.	f
523	1	What should you make networks as small as possible?	For:\r\n- security\r\n- maintenance\r\n- management	f
524	1	How you divide a network?	By subnetting.	f
525	1	What does a /27 CIDR mean?	The first 27 bits are masked with 1s. The remaining 5 bits are reachable in the subnet.	f
526	1	What does a /24 CIDR mean?	The first 24 bits of the IP address are masked. Only hosts with addresses in the unmasked portion are reachable.	f
527	1	What is a block cipher?	A block cipher is a method of encrypting text (to produce ciphertext) in which a cryptographic key and algorithm are applied to a block of data (for example, 64 contiguous bits) at once as a group rather than to one bit at a time.	f
528	1	What is QUIC?	QUIC is a new transport which reduces latency compared to that of TCP. On the surface, QUIC is very similar to TCP+TLS+HTTP/2 implemented on UDP.	f
529	1	What is Capsicum?	A sandboxing framework that adds capability-based security to unix-like kernels and denies access to global namespaces.	f
530	1	What is a global namespace in unixy terms?	aspects of a system that can be accessed from anywhere:\r\n- file paths\r\n- networks\r\n- PIDs	f
531	1	What is Google Native Client?	Also called NaCl, Native Client is a sandbox for running compiled C and C++ code in the browser efficiently and securely, independent of the user’s operating system.	f
532	1	What are web sockets?	Full-duplex communication between client and server.	f
533	1	What is the same-origin policy?	Goal: Two websites should not be able to tamper with each other.\r\nStrategy: each resource is assigned an origin. JS can only access resources from its own origin.\r\nOrigin: scheme + hostname + port	f
534	1	How can 2 origins (let's say 2 frames) communicate?	window.postMessage (HTML5) allows for sending data messages between two windows/frames across domains.	f
676	1	Time to send 2K bytes over 1 Gbps network?	10,000 nanoseconds (0.01 ms)	f
536	1	What is PyPy?	PyPy is a replacement for CPython. It is built using the RPython language that was co-developed with it. RPython is a subset of Python and can be translated to C. The main reason to use it instead of CPython is speed: it runs generally faster due to JIT compilation.\r\nPyPy implements Python 2.7.10. It supports all of the core language, passing the Python test suite (with minor modifications that were already accepted in the main python in newer versions). It supports most of the commonly used Python standard library modules.	f
537	1	What does SMT stand for?	Satisfiability modulo theories.	f
538	1	What is an SMT solver?	A satisfiability modulo theories solver solves for large interconnected logic formulas to determine if a given formula can be satisfied. These are helpful for determining the outcome or inputs for a program using symbolic execution.	f
539	1	How do we find that a condition exists that will cause a program to have a predicted outcome?	Using an SAT solver (using logic tests) and an SMT solver (that plugs in numbers), and tells the SAT solver where it got it wrong. They provide feedback in a cycle to each other until a condition can be found.	f
540	1	What is  transactional memory?	Transactional memory attempts to simplify concurrent programming by allowing a group of load and store instructions to execute in an atomic way. It is a concurrency control mechanism analogous to database transactions for controlling access to shared memory in concurrent computing.	f
541	1	What is software transactional memory?	Software transactional memory provides transactional memory semantics in a software runtime library or the programming language, and requires minimal hardware support (typically an atomic compare and swap operation, or equivalent). As the downside, software implementations usually come with a performance penalty, when compared to hardware solutions.	f
542	1	Does PyPY have a GIL?	Yes. The GIL is very difficult to remove. You can use pypy-stm instead, which uses software transactional memory, but will suffer a performance penalty.	f
543	1	How can a server deal with a SYN flood attack?	When it detects a large number of SYN packets at once, or the size of its SN (sequence number) data structure reaches a certain threshold of entries, it can switch to a stateless version, where it send SN responses as signed values with a timestamp, and if it receives one back it lets them through without needing a lookup table.	f
544	1	What is a stack canary?	It's a buffer overflow defense where a random value is pushed onto the stack after the saved EBP, and before tearing down the stack frame, the value is checked. Any buffer flow targeting the return instruction pointer would have to have overwritten this value.	f
545	1	What type of buffer overflow protection does gcc and Visual Studio employ?	They use a stack check guard of bytes before and after the buffer's allocated memory. Once values are written to the buffer, the bytes are checked to ensure they are still the same.	f
546	1	What is scalability?	Scalability is the measure to which a system can adapt to a change in demand for resources, without negatively impacting performance.	f
547	1	What is Akka?	An open source project that provides a simpler, single programming model - one way of coding for concurrent and distributed applications - the actor programming model.\r\nAkka’s primary goal is to make it simpler to build applications that are deployed in the cloud or run on devices with many cores and that efficiently leverage the full capacity of the computing power available. It’s a toolkit that provides an actor model, runtime, and required supporting tools for building scalable applications.	f
548	1	What is an actor?	Briefly, actors are a lot like message queues without the configuration and message broker installation overhead. They’re like programmable message queues shrunk to microsize—you can easily create thousands, even millions of them. They don’t “do”\r\nanything unless they’re sent a message.\r\nMessages are simple data structures that can’t be changed after they’ve been created, or in a single word, they’re immutable.\r\nActors can receive messages one at a time and execute some behavior whenever a message is received. Unlike queues, they can also send messages (to other actors).\r\nEverything an actor does is executed asynchronously. Simply put, you can send a message to an actor without waiting for a response. Actors aren’t like threads, but messages sent to them are pushed through on a thread at some point in time. How actors are connected to threads is configurable - this is not a hardwired relationship.\r\nFor now the most important aspect of actors is that you build applications by sending and receiving messages. A message could be processed locally on some available thread, or remotely on another server. Exactly where the message is processed and where the actor lives are things you can decide later, which is very different compared to hardcoding threads and RPC style networking. Actors make it easy to build your application out of small parts that resemble networked services, only shrunk to microsize in footprint and administrative overhead.	f
549	1	What is an IDL-based encoding?	An interface description language or interface definition language (IDL) encoding. \r\nIt requires a schema definitions. They offer peace of mind with respect to data format and validation for consumers while sacrificing flexibility in the schema’s evolution.	f
550	1	What is Tarantool?	An in-memory noSQL database that uses write-ahead logging for crash resistance and persistence.	f
551	1	What is a coroutine?	An object representing activity that eventually completes. Also refers the the function we call that returns a coroutine.\r\nIn Python, coroutines are generators.	f
552	1	What is a future?	An object representing a result that may not be available yet.	f
553	1	What is AQP?	Approximate query processing. It means pulling a sample of data instead of taking time to process an exact result. It is often used when a data storage involves terabytes or more.	f
554	1	How would you visualize billions of items in a graph?	In many cases, you don't need to graph every point, just use visualization-aware sampling. Sometime 1% or less will do.	f
555	1	What is F1/Spanner?	Fault-Tolerant Distributed RDBMS (Spanner) Supporting Google's Ad Business (F1)	f
556	1	What is Photon?	Fault-tolerant and Scalable Joining of Continuous Data Streams	f
557	1	What is Mesa?	Geo-Replicated, Near Real-Time, Scalable Data Warehousing	f
558	1	How does Google use multi-homed datacenters?	A multi-homed system runs live in multiple datacenters all the time. Each datacenter processes work all the time, and work is dynamically shared between datacenters to balance load. When one datacenter is slow, some fraction of work automatically moves to faster datacenters. When a datacenter is completely unavailable, all its work is automatically distributed to other datacenters.	f
559	1	What is ElasticSearch?	Open Source, Distributed, RESTful Search Engine	f
677	1	Time to read 4KB randomly from an SSD?	150,000 nanoseconds (0.15 ms)	f
560	1	What is an example of a circuit breaker?	Start sending 503s if your service is choked to avoid numerous simultaneous retries that just make the system worse.	f
561	1	What is the name of Google's search ranking algorithm?	Hummingbird. PageRank is just one factor used by the algorithm.	f
562	1	What is celery?	Distributed Task Queue	f
563	1	LRU is the most popular type of what kind of policy?	Eviction	f
564	1	What does an eviction policy try to predict?	An eviction policy tries to predict which entries are most likely to be used again in the near future, thereby maximizing the hit ratio	f
565	1	What is Caffiene?	Caffeine is a high performance, near optimal caching library based on Java 8.	f
566	1	What is request coalescing?	When many requests arrive for some content that’s missing in the cache (cache miss), only one instance request will proceed to the backend to fetch the content on behalf of all to avoid a flood.	f
567	1	When might you need to use a NoSQL database	You don’t have any relational data.\r\nIf you need to store > 5 TB of data or you have an incredibly data intensive workload.\r\nYour application has super low-latency requirements.\r\nYou need really high throughput.	f
568	1	What is AMP?	AMP is a restricted subset of HTML designed to make the web fast on mobile devices.\r\nProvides a shared library of scripts so they don’t have to downloaded every time.\r\nSets standards for the architecture of advertising so advertising doesn't infect pages.\r\nShared mechanism for collecting data for analytics so you don’t have N different packages on a page gathering stats.	f
569	1	What is a benefit of making processes asynchronous?	Flexibility in the architecture. Getting users on hooked on synchronous low-latency interactions doesn't allow for architecture flexibility.	f
570	1	What is BASE?	basically available\r\nsoft state\r\neventually consistent\r\n\r\nA BASE based system is more tolerant to latency because it is an inherently partitioned and loosely coupled architecture and it uses eventual consistency.	f
571	1	What is ACID?	atomicity\r\nconsistency\r\nisolation\r\ndurability	f
572	1	What is the CAP theorem?	The CAP theorem, also named Brewer's theorem, states that it is impossible for a distributed computer system to simultaneously provide all three of the following guarantees:\r\n\r\n- Consistency (all nodes see the same data at the same time)\r\n- Availability (every request receives a response about whether it succeeded or failed)\r\n- Partition tolerance (the system continues to operate despite arbitrary partitioning due to network failures)	f
573	1	What is zero copy?	Applications that use zero copy request that the kernel copy the data directly from the disk file to the socket, without going through the application. Zero copy greatly improves application performance and reduces the number of context switches between kernel and user mode.	f
574	1	What is a metaclass?	Any callable (function or class) that implements type()'s function signature.	f
575	1	What is privilege separation?	Separating an application into different areas so a vulnerability in one area doesn't affect the entire application.	f
576	1	In security, what is a principal?	An entity with privileges or rights.	f
577	1	In Unix, who is the owner of a file?	The user with the user ID that matches the UID of the inode.	f
578	1	What privilege do you need to lookup files or directories in a path?	The executable permission.	f
579	1	When is security enforced on a file?	Security is checked when the file descriptor is created. Then it's up to the user to be careful and secure the file descriptor.	f
580	1	What is ptrace?	ptrace is a system call found in several Unix and Unix-like operating systems. By using ptrace, one process can control another, enabling the controller to inspect and manipulate the internal state of its target.	f
581	1	What can you use to debug a process?	ptrace	f
582	1	What user privilege is required to bind to ports < 1024?	root	f
583	1	During system bootstrapping, what call is performed by the system to give a non-root user the ownership of a process?	setuid()	f
584	1	What are the setuid binaries?	su\r\nsudo	f
585	1	What does chroot do?	Changes the root directory (/) for a user to be a directory on the filesystem where they can't escape.	f
586	1	What is a confused deputy?	A confused deputy is a computer program that is innocently fooled by some other party into misusing its authority. It is a specific type of privilege escalation. In information security, the confused deputy problem is often cited as an example of why capability-based security is important, as capability systems protect against this whereas access control list-based systems do not.\r\nThe classic example is a Fortran compiler that creates a billing record for each use. A user was able to tell the compiler to output a binary with the same name as the billing file, overwriting it.	f
587	1	What is an example of a confused deputy in the web frontend world?	A CSRF attack.	f
588	1	What is ambient authority, or ambient privilege?	The decision about whether a process or agent can perform an action is based on information not explicitly stated, but inherited instead.	f
589	1	What is a capability?	The privilege to act upon something given your ownership of it, and the inability to act on something using an intermediate process' privileges. An example would be a function where you pass a file descriptor as an argument and the function uses your capability, not its own.	f
590	1	What is a requirement of enabling sandboxing?	The kernel must be able to support it by disallowing system calls that reference global namespaces:\r\n- file paths starting at root - must be relative\r\n- network\r\n- PIDs - use process descriptors instead	f
591	1	How is RSA decryption optimized for speed?	- c^d mod p and c^d mod q are processed in parallel and merged at the end using the Chinese remainder theorem\r\n- put into Montgomery format\r\n- sliding windows to exponentiate on bits of exponent\r\n- perhaps a single extra reduction\r\n- convert back from Montgomery format\r\n- merge using CRT	f
592	1	How do you change a positive integer to negative?	Subtract 1, flip all bits	f
593	1	How do you change a negative integer to positive?	Flip all bits, then add 1	f
594	1	What is Intel architecture?	CISC - Complex Instruction Set Computer\r\nMany special-purpose instructions.	f
595	1	What size are Intel instructions?	They are variable-length, from 1 to theoretically 16 bytes.	f
596	1	What is RISC?	Reduced Instruction Set Architecture. \r\n- more registers\r\n- fewer, fixed-sized instructions\r\n- used in PowerPC, ARM, SPARC, MIPS	f
597	1	What Endianness is Intel?	Little Endian, but only in memory. In registers, all are Big Endian.	f
599	1	What is Little Endianness?	The least significant bytes of a word or larger are stored in the lowest address. All bytes are the same. There is no Endianness within a byte.	f
600	1	How many registers are on CISC?	8 general-purpose registers and an instruction pointer. 2 of 8 are not that general.	f
601	1	What is the word size on Intel?	16 bits	f
602	1	What is the double-word size on Intel?	32 bits	f
603	1	What is Big Endianness?	The most significant bytes of a word or larger are stored in the lowest address.	f
604	1	What is the EAX register used for?	Stores the function's return value.	f
605	1	What is the EBX register used for?	Base pointer to the data section.	f
606	1	What is the ECX register used for?	Counter for string and loop operations.	f
607	1	What is the EDX register used for?	I/O pointer	f
608	1	What is the ESI register used for?	Source pointer for string or other copy operations.	f
609	1	What is the EDI register used for?	Destination pointer for string or other copy operations.	f
610	1	What is the ESP register used for?	Stack pointer	f
611	1	What is the EBP register used for?	Stack frame base pointer	f
612	1	What is the EIP register used for?	Instruction pointer - next instruction pointer to execute.	f
613	1	What are the caller-save registers?	eax\r\nedx\r\necx	f
614	1	What are the callee-save registers?	ebp\r\nebx\r\nesi\r\nedi	f
615	1	Other than the main registers, what other registers can be used?	Legacy 8 and 16-bit registers: AX, AH, AL, SP, BP, SI	f
616	1	What is the caller register-saving convention on Linux systems?	cdecl - C declaration	f
617	1	What is avalancing?	The effect of a hashing method where a small change in the input has a large effect on the output.	f
618	1	What is Chef?	A configuration tool. You write or reuse recipes that declare the state you wish your server to be in. It calculates the delta and builds out for you.	f
619	1	What is an example of a non-cryptographic hash function?	MurmurHash is an efficient, non-cryptographic hash function suitable for general hash-based lookup. The name comes from two basic operations, multiply (MU) and rotate (R), used in its inner loop. It has an avalanche effect. The current version is MurmurHash3 which yields a 32-bit or 128-bit hash value.	f
620	1	How could you process calculations on elements of an array in parallel?	Using recursion, divide and conquer, breaking down the array into smaller segments, then merging the values as the recursion unwinds. Non-mutation of the array means locking is not required.	f
621	1	What factor should you keep in mind when doing parallel computation on different parts of a large data structure?	The memory bandwidth of your RAM. It can become a bottleneck.	f
622	1	What will be the computation time when processing multiple tasks?	The length of time the longest subcomputation takes.	f
623	1	Why should you avoid starting and joining a task or thread on the same line or proximity?	Execution on the current thread will block until it completes, thereby obviating the concurrent call.	f
624	1	What factors affect performance?	- processor speed \r\n- number of processors\r\n- memory access latency and throughput\r\n- cache behavior\r\n- runtime behavior (garbage collection, JIT compilation, thread scheduling)	f
625	1	What is Amdahl's Law?	It gives the theoretical speedup in latency of the execution of a task at fixed workload that can be expected of a system whose resources are improved.	f
626	1	What aspects are important in measuring and benchmarking performance, parallel or otherwise?	- multiple repetitions\r\n- statistical treatment - mean and variance\r\n- eliminate statistical outliers\r\n- ensuring steady-state (warm-up)\r\n- preventing anomalies (garbage collection, JIT compilation, compiler optimizations in benchmark code that misrepresents real-world)	f
627	1	When associative operations are used, what does it mean?	Grouping doesn't matter. It will evaluate to the same result.	f
628	1	What is a synonym of reduce()?	fold()	f
629	1	What is the commutative property?	The condition that a group of quantities connected by operators gives the same result whatever the order of the quantities involved. So order of operands doesn't matter, but grouping may matter.	f
630	1	What is a bag?	A multiset.	f
631	1	What is a multiset?	A set in which elements do not have to be unique.	f
632	1	What are some examples of operations that are both associative and commutative?	- Addition and multiplication of integers\r\n- Union, intersection, and  symmetric difference of sets\r\n- Addition of vectors\r\n- Addition of matrices of fixed dimension\r\n- Addition and multiplication of polynomials	f
633	1	What are some examples of operations that are associative but not commutative?	- concatenation of lists\r\n- concatenation of strings\r\n- matrix multiplication	f
634	1	What should we worry about floating point addition and multiplication?	It is commutative but not associative.	f
635	1	What is the rule of thumb before optimizing or parallelizing?	Ensure the code works correctly first. Then, if you want to get fancy, you can begin to optimize your code for greater speed.	f
636	1	Does Python have an opcode cache?	In a way. It outputs a .pyc file, containing the bytecode. When a module is imported for the first time, or when the source is more recent than the current compiled file, a .pyc file containing the compiled code will usually be created in the same directory as the .py file. When you run the program next time, Python uses this file to skip the compilation step.	f
637	1	Design a URL shortening service.	ask:	f
638	1	How would you design the feature in LinkedIn where it computes how many hops there are between you and another person?	ask:	f
639	1	If you were to design a web platform for online chess games, how would you do that?	ask:\r\n-	f
640	1	What are some key things to remember when scaling a large system?	1) Asynchronous is good  (use queues, topics/pub-sub)\r\n2) Parallel is good  (multi-threading, load balancing etc.)\r\n3) Avoid points of contention e.g. synchronization\r\n4) Avoid writing to disk until you must - cache like crazy\r\n5) Scale out not up\r\n6) At web scale the speed of light is a problem\r\n7) At web scale everything fails - networks, load balancers etc.	f
641	1	What is Thrift?	Apache Thrift is a framework for scalable cross-language services development. It combines a software stack with a code generation engine to build services that work efficiently and seamlessly between different languages. It handles serialization and has its own communication protocol.\r\nIDL-based.	f
642	1	What is Memcache?	An in-memory distributed hash table. It supports only a few commands but it is extremely efficient.	f
643	1	How does/did Facebook use memcache and mySQL in 2009?	No joins in production. They have many logical databases for all of their types: people, events, place info, etc. They treat the web tier as a CPU, memcache as system memory, and the database as disk. Everything has an ID and you use the ID to query memcache using a multiget. Any misses are fetched from the database and cached in memcache.	f
644	1	What is an out-of-band cache?	A cache layer that does not synch with persistent storage. When changes are made to the database, there are no notifications to synchronize with the cache. The cache entry would need to be updated or evicted by other means.	f
645	1	What is a monad?	In functional programming, monads are a way to build computer programs by joining simple components in predictable and robust ways. A monad is a structure that represents computations defined as sequences of steps: a type with a monad structure defines what it means to chain operations together, or nest functions of that type. This allows the programmer to build pipelines that process data in a series of steps (i.e. a series of actions applied to the data), in which each action is decorated with additional processing rules provided by the monad. A monad is defined by a return operator that creates values, and a bind operator used to link the actions in the pipeline.	f
646	1	What is pyramidpypi?	A self-hosted mirror of pypi.	f
647	1	Big Omega represents what?	A lower bound on the growth of a function. f grows at least as fast as g.	f
648	1	Theta represents what?	A tight asymptotic bound on a function, in other words if both f and g have approximately the same rate of growth.	f
649	1	For graph problems, the complexity  Theta(N + M) is known as what?	linear in the graph size	f
650	1	What is a better way of saying "at least O(n^2)"?	big Omega(n^2)	f
651	1	What is data normalization?	Normalization is a systematic approach of decomposing tables to eliminate data redundancy and undesirable characteristics like insertion, update and deletion anomalies.\r\n\r\nNormalization is used for mainly two purpose,\r\n- eliminating redundant (useless) data\r\n- ensuring data dependencies make sense	f
652	1	What are the requirements for first normal form?	- each cell has a single value\r\n- all items in a column must be of the same type\r\n- rows are uniquely identified by a unique ID or a composite key	f
653	1	What are the requirements for second normal form?	All attributes (non-key columns) are dependent on the key	f
654	1	What are the requirements for third normal form?	All fields can only be determined by the key in the table and no other column.	f
655	1	What are the requirements for fourth normal form?	No multi-valued dependencies, meaning records should not be duplicated in a table just because more than one item is associated. This creates records that are duplicates except for one field.	f
656	1	What are some use cases of Hadoop?	- reporting on user behavior over many events\r\n- log processing of 100s of billions of rows	f
657	1	What are some solid principles to keep in mind for scaling?	- Keep it very simple\r\n- Don’t re-invent the wheel\r\n- Go with boring, proven and well-supported technologies when you can\r\n- Build for what you will need over the next 12-18 months\r\n- Make different things look the same\r\n- Cache to protect the database\r\n- Good enough is good enough	f
658	1	What is gunicorn?	A Python WSGI HTTP Server	f
659	1	What is WSGI?	WSGI is the Web Server Gateway Interface. It is a specification that describes how a web server communicates with web applications, and how web applications can be chained together to process one request. It was outlined in PEP 3333.\r\n\r\nA WSGI server (meaning WSGI compliant) only receives the request from the client, pass it to the application and then send the response returned by the application to the client.	f
660	1	What is Fabric?	Fabric is a Python (2.5-2.7) library and command-line tool for streamlining the use of SSH for application deployment or systems administration tasks.	f
661	1	What is Apache Solr?	Solr is an open source enterprise search platform built on Apache Lucene.\r\nSolr is highly reliable, scalable and fault tolerant, providing distributed indexing, replication and load-balanced querying, automated failover and recovery, centralized configuration and more.	f
662	1	What is munin?	Graph metrics and alerting.	f
663	1	What tends to become an issue as you add services in a datacenter and have to ping more caches and services to fulfill a request?	Fan-in, where you can overload routers due to increased internal network traffic.	f
664	1	What can Redis be used for?	- a noSQL key-value store\r\n- caches\r\n- queues	f
665	1	What is a benefit of sharding a database as it grows, and what determines the size?	Keeping the index in cache ensures a user lookup doesn't have to hit the disk, lookups can be served from RAM. How much RAM you have will determine the index size which will hint at the underlying data size.	f
666	1	Why do most businesses end up sharding as they scale?	To support massive concurrent writes.	f
667	1	What is a message broker?	Message broker is an intermediary program module that translates a message from the formal messaging protocol of the sender to the formal messaging protocol of the receiver. Message brokers are elements in telecommunication networks where software applications communicate by exchanging formally-defined messages. Message brokers are a building block of Message oriented middleware.	f
668	1	What are some examples of message brokers?	Apache ActiveMQ\r\nApache Kafka\r\nApache Qpid\r\nCelery\r\nGearman\r\nHornetQ (Red Hat)\r\nIBM Integration Bus\r\nJBoss Messaging (JBoss)\r\nJORAM\r\nMicrosoft BizTalk Server (Microsoft)\r\nMicrosoft Azure Service Bus (Microsoft)\r\nNATS (MIT Open Source License, written in Go)\r\nOpen Message Queue\r\nOracle Message Broker (Oracle Corporation)\r\nQDB (Apache License 2.0, supports message replay by timestamp)\r\nRabbitMQ (Mozilla Public License, written in Erlang)\r\nSAP PI (SAP AG)\r\nSpread Toolkit\r\nTarantool, a NoSQL database, with a set of stored procedures for message queues\r\nWSO2 Message Broker\r\nEnduro/X Transactional Message Queue (TMQ)	f
669	1	What is Ehcache?	Ehcache is an open source, standards-based cache that boosts performance, offloads your database, and simplifies scalability. It's the most widely-used Java-based cache.	f
670	1	Timing of a L1 cache reference?	0.5 nanoseconds (ns)	f
671	1	Timing of a branch misprediction?	5 nanoseconds (ns)	f
672	1	Timing of a L2 cache reference?	7 nanoseconds (ns)	f
673	1	Timing of a mutex lock/unlock?	25 nanoseconds (ns)	f
674	1	Timing of a main memory reference?	100 nanoseconds (ns)	f
675	1	Timing to compress 1KB?	3,000 nanoseconds (3 microseconds)	f
678	1	Timing to read 1MB sequentially from memory?	250,000 nanoseconds (0.25 ms)	f
679	1	Timing of a disk seek?	10,000,000 nanoseconds (10 ms)	f
680	1	Time to read 1MB sequentially from an SSD?	1,000,000 nanoseconds (1 ms)\r\n4x memory	f
681	1	Timing to read 1MB sequentially from disk?	20,000,000 nanoseconds (20 ms)\r\n80x memory\r\n20x SSD	f
682	1	Timing to send a packet CA -> Netherlands -> CA?	150,000,000 nanoseconds (150 ms)	f
683	1	Timing of a context switch between processes?	3000 nanoseconds	f
684	1	Timing of fork()?	Between 70,000 and 160,000 nanoseconds.	f
685	1	What is the timing overhead for a system call?	400 nanoseconds	f
686	1	What is Kafka?	Apache Kafka is pub-sub messaging rethought as a distributed commit log.\r\nKafka is a distributed, partitioned, replicated commit log service. It provides the functionality of a messaging system, but with a unique design.\r\nA single Kafka broker can handle hundreds of megabytes of reads and writes per second from thousands of clients.	f
687	1	What is GAE?	Google App Engine is a platform for building scalable web applications and mobile backends. App Engine provides you with built-in services and APIs such as NoSQL datastores, memcache, and a user authentication API, common to most applications.	f
688	1	What is GDS?	Google Cloud Datastore is a NoSQL document database built for automatic scaling, high performance, and ease of application development. Cloud Datastore features include:\r\n\r\nAtomic transactions.\r\nMassive scalability with high performance.\r\nFlexible storage and querying of data.\r\nBalance of strong and eventual consistency. \r\nEncryption at rest.\r\nFully managed with no planned downtime.	f
689	1	What is the problem that serialization introduces?	The overhead of serializing and deserializing. It's all expensive, and for Python, it can be terribly slow.	f
690	1	What does the Python bisect module do?	The bisect module, part of the standard library, provides support for maintaining a list in sorted order without having to sort the list after each insertion. For long lists of items with expensive comparison operations, this can be an improvement over the more common approach.	f
691	1	What is PycURL?	PycURL is a Python interface to libcurl. PycURL can be used to fetch objects identified by a URL from a Python program, similar to the urllib Python module. PycURL is mature, very fast, and supports a lot of features.\r\nPycURL is targeted at an advanced developer - if you need dozens of concurrent, fast and reliable connections or any of the sophisticated features listed above then PycURL is for you.\r\nThe main drawback of PycURL is that it is a relatively thin layer over libcurl without any of those nice Pythonic class hierarchies. This means it has a somewhat steep learning curve unless you are already familiar with libcurl's C API.	f
692	1	How does PycURL compare to requests?	PycURL can handle a large number of multiple concurrent requests. When reusing connections, it can perform more than 2,000 requests per second.\r\n\r\npycurl takes about 73 CPU-microseconds to issue a request when reusing a connection\r\nrequests takes about 526 CPU-microseconds to issue a request when reusing a connection\r\npycurl takes about 165 CPU-microseconds to open a new connection and issue a request (no connection reuse), or ~92 microseconds to open\r\nrequests takes about 1078 CPU-microseconds to open a new connection and issue a request (no connection reuse), or ~552 microseconds to open	f
693	1	What is ZooKeeper?	Apache ZooKeeper is a centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services. All of these kinds of services are used in some form or another by distributed applications. Each time they are implemented there is a lot of work that goes into fixing the bugs and race conditions that are inevitable. Because of the difficulty of implementing these kinds of services, applications initially usually skimp on them, which make them brittle in the presence of change and difficult to manage. Even when done correctly, different implementations of these services lead to management complexity when the applications are deployed.\r\nHas Java and C interfaces.	f
694	1	What is orthogonality?	In mathematical terms, it means being perpendicular.\r\n\r\nOrthogonality in programming language design is the ability to use various language features in arbitrary combinations with consistent results.\r\n\r\nOrthogonality is a system design property which guarantees that modifying the technical effect produced by a component of a system neither creates nor propagates side effects to other components of the system. Typically this is achieved through the separation of concerns and encapsulation, and it is essential for feasible and compact designs of complex systems. The emergent behavior of a system consisting of components should be controlled strictly by formal definitions of its logic and not by side effects resulting from poor integration, i.e., non-orthogonal design of modules and interfaces. Orthogonality reduces testing and development time because it is easier to verify designs that neither cause side effects nor depend on them.	f
695	1	When dealing with scaling, how can you deal with rapidly increasing counters, like YouTube video views?	You can add randomness to a monotonic counter, because as long as people can see it is increasing somewhat monotonically, it doesn't need to be 100% accurate. And avoids need to lock it in a transaction.	f
696	1	What is exponential backoff and when is it used?	Binary exponential backoff or truncated binary exponential backoff refers to an algorithm used to space out repeated retransmissions of network or other service requests, often as part of congestion avoidance.	f
697	1	What data structure could be used to efficiently manage a leaderboard?	A b-tree where each node manages a subset of the range of the worst to best scores.	f
698	1	What does adding jitter in system design help you avoid?	If your system doesn’t jitter then you get thundering herds. Distributed applications are really weather systems. Debugging them is as deterministic as predicting the weather. Jitter introduces more randomness because surprisingly, things tend to stack up.	f
699	1	What is an example of adding jitter to a caching system?	Cache expirations. For a popular video they cache things as best they can. The most popular video they might cache for 24 hours. If everything expires at one time then every machine will calculate the expiration at the same time. This creates a thundering herd.\r\nBy jittering you are saying randomly expire between 18-30 hours. That prevents things from stacking up. They use this all over the place. Systems have a tendency to self synchronize as operations line up and try to destroy themselves. Fascinating to watch. You get slow disk system on one machine and everybody is waiting on a request so all of a sudden all these other requests on all these other machines are completely synchronized. This happens when you have many machines and you have many events. Each one actually removes entropy from the system so you have to add some back in.	f
826	1	What is the proper name for Endianness?	octet order	f
700	1	What value can you make cron or other system intervals so they don't coincide?	Use distinct prime numbers for periodicities.	f
701	1	What Python package provides tools for adapting or extending functions and other callable objects, without completely rewriting them?	functools\r\noffers:\r\nDecorators\r\nComparison\r\nRich Comparison\r\nCollation Order\r\nCaching\r\nReducing a Data Set\r\nGeneric Functions	f
702	1	What is a proxy server?	A proxy server is an intermediate piece of hardware/software that receives requests from clients and relays them to the backend origin servers. Typically, proxies are used to filter requests, log requests, or sometimes transform requests (by adding/removing headers, encrypting/decrypting, or compression).	f
703	1	What is collapsed forwarding?	A proxy server can collapse the same (or similar) requests together into one request, and then return the single result to the requesting clients.\r\n\r\nAnother great way to use the proxy is to not just collapse requests for the same data, but also to collapse requests for data that is spatially close together in the origin store (consecutively on disk).	f
704	1	What should be handling requests first, a proxy server or a cache?	Generally it is best to put the cache in front of the proxy. This is because the cache is serving data from memory, it is very fast, and it doesn't mind multiple requests for the same result. But if the cache was located on the other side of the proxy server, then there would be additional latency with every request before the cache, and this could hinder performance.	f
705	1	What are some popular proxies?	HAProxy\r\nSquid\r\nVarnish	f
706	1	Why do indexes tend to slow down writes?	Since you must both write the data and update the index.	f
707	1	What is the role of a load balancer?	The role is to distribute load across a set of nodes responsible for servicing requests. This allows multiple nodes to transparently service the same function in a system. Their main purpose is to handle a lot of simultaneous connections and route those connections to one of the request nodes, allowing the system to scale to service more requests by just adding nodes.	f
708	1	What is a drawback of advanced features in a load balancer?	Advanced features can make problem diagnosis cumbersome. For example, when it comes to high load situations, load balancers will remove nodes that may be slow or timing out (because of too many requests), but that only exacerbates the situation for the other nodes.	f
709	1	What is a benefit of adding asynchrony to a system?	It keeps clients from holding connections to servers when waiting for a response for a task that could simply be deferred. This reduces load on servers that are performing writes, for example, and lets them perform a task when ready, not on-demand.	f
710	1	What is the difference between a synchronous system and an asynchronous system?	In a synchronous system, there is no differentiation between request and reply, and they therefore cannot be managed separately. In an asynchronous system the client requests a task, the service responds with a message acknowledging the task was received, and then the client can periodically check the status of the task, only requesting the result once it has completed.\r\n\r\nWhile the client is waiting for an asynchronous request to be completed it is free to perform other work, even making asynchronous requests of other services.	f
711	1	What are some examples of well-known queue (or can act as a queue) software?	BeanstalkD\r\nRabbitMQ\r\nActiveMQ\r\nBeanstalkD\r\nRedis	f
712	1	Does asynchronous code tend to be CPU-bound or I/O bound?	Asynchronous code tends to be CPU bound, because anything that would block is simply deferred to later, until the blocking operation completes. This means that threads in asynchronous / non-blocking applications are much more likely to use their full time quantum before the kernel scheduler preempts them.	f
713	1	What is the optimal number of threads?	And if there's the same number of runnable threads as there are hardware threads, the kernel is very likely to reschedule threads on the same core, which significantly helps performance.	f
714	1	What is the typical time slice for a process on a Linux box?	Linux kernels are often compiled with HZ=100, which entails that processes are given time slices of 10ms.	f
715	1	How does Linux handle CPU affinity?	Default Linux kernels don't do a good job at keeping CPU affinity, even on idle machines. You must explore alternative schedulers or use taskset or cpuset to control affinity yourself.	f
716	1	What is futex?	A futex (short for "fast userspace mutex") is a Linux kernel system call that programmers can use to implement basic locking, or as a building block for higher-level locking abstractions such as semaphores and POSIX mutexes or condition variables.	f
717	1	How do context switches perform under virtualization?	On average, it's 2.5x to 3x more expensive to do a context switch when using virtualization. My guess is that this is due to the fact that the guest OS can't update the page table itself, so when it attempts to change it, the hypervisor intervenes, which causes an extra 2 context switches (one to get inside the hypervisor, one to get out, back to the guest OS).	f
718	1	What is a Frame Check Sequence?	The Frame Check Sequence (FCS) field is used to determine if errors occurred in the transmission and reception of the frame. Error detection is added at the Data Link layer because this is where data is transferred across the media.	f
719	1	How does Google handle a search request?	Scatter/gather\r\nIn this model, the dispatcher multicast the request to all workers of the pool. Each worker will compute a local result and send it back to the dispatcher, who will consolidate them into a single response and then send back to the client.	f
720	1	What is an example of bulk synchronous processing?	Parallel Graph Transformation\r\n\r\nThe main goal of Graph transformation is to modify the graph. This include modifying the properties of existing nodes and arcs, creating new arcs / nodes and removing existing arcs / nodes. The modification logic is provided by a user-defined function, which will be applied to all active nodes.	f
721	1	Execution Orchestrator	This model is based on an intelligent scheduler / orchestrator to schedule ready-to-run tasks (based on a dependency graph) across a clusters of dumb workers.\r\n\r\nexample: Microsoft Dryad	f
722	1	What are 2 reasons for using a load balancer?	horizontal scalability and redundancy	f
723	1	What are balancing methods used by load balancers?	assignment of a request: random, round-robin, random with weighting for machine capacity, etc\r\nmatched with current status (available for requests, not responding, elevated error rate, etc).	f
724	1	What are the 3 choices in load balancers? The 3 kinds, not balancing mechanisms.	- Smart client, a software based mechanism for determining the availability of a server.\r\n- Hardware load balancer, such as Citrix NetScaler, are remarkably expensive, and they are also "non-trivial" to configure.\r\n- Software load balancer: HAProxy	f
725	1	What are 2 examples of in-memory caches?	Memcached and Redis are both examples of in-memory caches	f
726	1	What is write-through cache?	Write-through cache directs write I/O onto cache and through to underlying permanent storage before confirming I/O completion to the host. This ensures data updates are safely stored on, for example, a shared storage array, but has the disadvantage that I/O still experiences latency based on writing to that storage. Write-through cache is good for applications that write and then re-read data frequently as data is stored in cache and results in low read latency.	f
727	1	What is write-back cache?	Write-back cache is where write I/O is directed to cache and completion is immediately confirmed to the host. This results in low latency and high throughput for write-intensive applications, but there is data availability exposure risk because the only copy of the written data is in cache. As we will discuss later, suppliers have added resiliency with products that duplicate writes. Users need to consider whether write-back cache solutions offer enough protection as data is exposed until it is staged to external storage. Write-back cache is the best performing solution for mixed workloads as both read and write I/O have similar response time levels.	f
728	1	What is read-through cache?	An item is accessed from cache, and if it's a cache miss, the data will be read from persistent storage (perhaps with a callback) and then placed into cache. The response is then sent back to the host.	f
729	1	What is HDFS?	Hadoop File System (HDFS) is a Java-based file system that provides scalable and reliable data storage, and it was designed to span large clusters of commodity servers.	f
730	1	What is Hortonworks?	Hortonworks is a software company focused on the development and support of Apache Hadoop, a framework that allows for the distributed processing of large data sets across clusters of computers.	f
731	1	What is a platform layer?	Web applications to communicate with a platform layer which in turn communicates with your databases. \r\n\r\nFirst, separating the platform and web application allow you to scale the pieces independently. If you add a new API, you can add platform servers without adding unnecessary capacity for your web application tier. \r\n\r\nSecond, adding a platform layer can be a way to reuse your infrastructure for multiple products or interfaces (a web application, an API, an iPhone app, etc) without writing too much redundant boilerplate code for dealing with caches, databases, etc.\r\n\r\nThird, a sometimes underappreciated aspect of platform layers is that they make it easier to scale an organization. At their best, a platform exposes a crisp product-agnostic interface which masks implementation details. If done well, this allows multiple independent teams to develop utilizing the platform's capabilities, as well as another team implementing/optimizing the platform itself.	f
732	1	What is multi-homing?	Running a service across multiple datacenters.	f
733	1	Where is weak consistency OK?	- caching\r\n- VOIP\r\n- real-time mutiplayer games	f
734	1	What is the Paxos algorithm?	Paxos is a family of protocols for solving consensus in a network of unreliable processors. Consensus is the process of agreeing on one result among a group of participants. This problem becomes difficult when the participants or their communication medium may experience failures.	f
735	1	What problem does consistent hashing help solve?	If you're using a caching scheme like server = hash(i) mod m, and one server in the cluster drops out, consistent hashing is needed to avoid swamping your servers when all the caches need to rehash their entities.	f
736	1	What is the relationship between consistent hashing and memcache?	Consistent hashing can be used with memcache not even knowing about it.  It is interesting to note that it is only the client that needs to implement the consistent hashing algorithm - the memcached server is unchanged.	f
737	1	What are some examples of NoSQL solutions?	Google BigTable\r\nHBase (based on Hadoop)\r\nHypertable\r\nAmazon DynamoDB\r\nVoldemort\r\nCassandra\r\nRiak\r\nRedis\r\nCouchDB\r\nMongoDB	f
738	1	What is Paxos an example of?	quorum-based 2PC (2 phase commit) protocol	f
739	1	What is MVCC?	Multiversion concurrency control (MCC or MVCC), is a concurrency control method commonly used by database management systems to provide concurrent access to the database and in programming languages to implement transactional memory.	f
740	1	What is the S in SOLID?	The single responsibility principle. There should never be more than one reason for a class to change. We can relate the “reason to change” to “the responsibility of the class”. So each responsibility would be an axis for change.	f
741	1	What does concurrent.futures do?	The concurrent.futures modules provides interfaces for running tasks using pools of thread or process workers. The APIs are the same, so applications can switch between threads and processes with minimal changes.	f
742	1	What is the O in SOLID?	The Open/Closed Principle (OCP) states that the design and writing of the code should be done in a way that new functionality should be added with minimum changes in the existing code. The design should be done in a way to allow the adding of new functionality as new classes, keeping as much as possible existing code unchanged.\r\n"open for extension / closed for modifications"\r\n\r\n--\r\n\r\nDuring the 1990s, the open/closed principle became popularly redefined to refer to the use of abstracted interfaces, where the implementations can be changed and multiple implementations could be created and polymorphically substituted for each other.\r\n\r\nIn contrast to Meyer's usage, this definition advocates inheritance from abstract base classes. Interface specifications can be reused through inheritance but implementation need not be.	f
743	1	What is RTTI?	run time type identification	f
744	1	Which SOLID principle is "Make all Member Variables Private." helping to enforce?	The open/closed principle (OCP)	f
745	1	What is the L in SOLID?	The Liskov substitution principle (LSP)\r\nWe must make sure that the new derived classes just extend without replacing the functionality of old classes. Otherwise the new classes can produce undesired effects when they are used in existing program modules.\r\n\r\nLiskov's Substitution Principle states that if a program module is using a Base class, then the reference to the Base class can be replaced with a Derived class without affecting the functionality of the program module.\r\n\r\nThis principle is just an extension of the Open Close Principle and it means that we must make sure that new derived classes are extending the base classes without changing their behavior.	f
746	1	What is the I in SOLID?	The Interface Segregation Principle (ISP) states that clients should not be forced to implement interfaces they don't use. Instead of one fat interface many small interfaces are preferred based on groups of methods, each one serving one submodule.	f
747	1	What is the D in SOLID?	Dependency inversion principle (DIP)\r\nHigh-level modules should not depend on low-level modules. Both should depend on abstractions.\r\nAbstractions should not depend on details. Details should depend on abstractions.	f
748	1	What are 3 things CDNs use to ensure availability?	Local clustering can improve fault-tolerance and scalability. Mirroring (deploying clusters in a few locations) and multihoming (using multiple ISPs to connect to the Internet). \r\nClustering, mirroring, and multihoming are common approaches for sites with stringent reliability and scalability needs.	f
749	1	What is hyper-threading?	Hyper-threading enables a single processor core to be used for two or more concurrent executions with just a little extra hardware.	f
750	1	What is DMA?	DMA (Direct Memory Access) allows devices, with the help of the Northbridge, to store and receive data in RAM directly without the intervention of the CPU.	f
751	1	What does NUMA stand for?	Non-Uniform Memory Architecture	f
752	1	Where are SRAM and DRAM used?	SRAMs are used in Caches because of higher speed and DRAMs are used for main memory in a PC because of higher densities.	f
753	1	What is the difference between SRAM and DRAM?	DRAM stands for Dynamic Random Access Memory. It is a type of semiconductor memory in which the memory is stored in the form of a charge. Each memory cell in a DRAM is made of a transistor and a capacitor. The data is stored in the capacitor. Capacitors loose charge due to leakage and hence DRAM's are volatile devices. To keep the data in the memory, the device must be regularly refreshed whereas SRAM is static, so it will retain a value as long as power is supplied. SRAM is typically faster than DRAM since it doesn't have refresh cycles. Since each SRAM memory cell is comprised of 6 Transistors unlike a DRAM memory cell, which is comprised of 1 Transistor and 1 Capacitor, the cost per memory cell is far greater in an SRAM compared to a DRAM.	f
754	1	What is the difference between a CPU core and a CPU thread?	The difference between a core and a thread is that separate cores have separate copies of (almost) all the hardware resources. The cores can run completely independently unless they are using the same resources–e.g., the connections to the outside - at the same time. Threads, on the other hand, share almost all of the processor’s resources.\r\nIntel’s implementation of threads has only separate registers for the threads and even that is limited, some registers\r\nare shared.	f
755	1	What is SMP?	symmetric multi-processor\r\n\r\nIn symmetric multi-processor (SMP) systems the caches of the CPUs cannot work independently from each other. All processors are supposed to see the same memory content at all times. The maintenance of this uniform view of memory is called “cache coherency”.	f
756	1	How does a multi-processor CPU maintain cache coherency?	- A dirty cache line is not present in any other processor’s cache.\r\n- Clean copies of the same cache line can reside in arbitrarily many caches.	f
757	1	What is Colossus?	the successor to the Google File System	f
758	1	What is Spanner?	Spanner is a scalable, globally-distributed database designed, built, and deployed at Google. At the highest level of abstraction, it is a database that shards data across many sets of Paxos state machines in datacenters spread all over the world. Replication is used for global availability and geographic locality; clients automatically failover between replicas. Spanner automatically reshards data across machines as the amount of data or the number of servers changes, and it automatically migrates data across machines (even across datacenters) to balance load and in response to failures. Spanner is designed to scale up to millions of machines across hundreds of datacenters and trillions of database rows.	f
759	1	What is Marzullo's algorithm?	Marzullo's algorithm, is an agreement algorithm used to select sources for estimating accurate time from a number of noisy time sources. A refined version of it, renamed the "intersection algorithm", forms part of the modern Network Time Protocol.	f
760	1	What is Google File System?	A scalable distributed file system for large distributed data-intensive applications. It provides fault tolerance while running on inexpensive commodity hardware, and it delivers high aggregate performance to a large number of clients.\r\nIt deals with multi-GB and TB files by appending to files, as that is the predominant usage pattern of large data files.	f
761	1	What is BNF?	BNF (Backus Normal Form or Backus–Naur Form) is one of the two main notation techniques for context-free grammars, often used to describe the syntax of languages used in computing, such as computer programming languages, document formats, instruction sets and communication protocols; the other main technique for writing context-free grammars is the van Wijngaarden form.	f
762	1	What is MapReduce?	MapReduce, developed by Google in 2004, is a programming model and an associated implementation for processing and generating large data sets. Users specify a map function that processes a key/value pair to generate a set of intermediate key/value pairs, and a reduce function that merges all intermediate values associated with the same intermediate key.	f
763	1	What is a Zipf distribution?	The Zipf distribution, sometimes referred to as the zeta distribution, is a discrete distribution commonly used in linguistics, insurance, and the modeling of rare events.	f
764	1	The memory addresses returned by the malloc function are typically aligned to at least ___ bytes.	8	f
765	1	What is AddressSanitizer?	AddressSanitizer is a fast memory error detector. AddressSanitizer finds out-of-bounds (for heap, stack, and globals) accesses and use-after-free bugs at the cost of 73% slowdown on average and a 3.4x memory size; the tool has no false positives.\r\nAddressSanitizer uses shadow memory to provide accurate and immediate bug detection. The conventional wisdom is that shadow memory either incurs high overhead through multi-level mapping schemes or imposes prohibitive address space requirements by occupying a large contiguous region. Our novel shadow state encoding reduces our shadow space footprint enough that we can use a simple mapping, which can be implemented with low overhead.\r\nIt has been included as a compilation option in LLVM since 3.1.	f
766	1	What is transitive closure?	transitive closure can be thought of as constructing a data structure that makes it possible to answer reachability questions. That is, can one get from node a to node d in one or more hops?	f
767	1	What is CUDA?	CUDA (Compute Unified Device Architecture) is a parallel computing platform and application programming interface (API) model created by NVIDIA.[1] It allows software developers and software engineers to use a CUDA-enabled graphics processing unit (GPU) for general purpose processing – an approach known as GPGPU. The CUDA platform is a software layer that gives direct access to the GPU's virtual instruction set and parallel computational elements, for the execution of compute kernels.[2]	f
768	1	What is Borg?	The first unified container-management system developed at Google. It was built to manage both long-running services and batch jobs.	f
769	1	What is MPM?	Within Google, MPM (Midas Package Manager) is used to build and deploy container images. It corresponds to the Docker image registry for Docker containers.	f
770	1	What are 3 benefits of containers?	1. Containers encapsulate the application environment, abstracting away many details of machines and operating systems from the application developer and the deployment infrastructure.\r\n2. Because well-designed containers and container images are scoped to a single application, managing containers means managing applications rather than machines. This shift of management APIs from machine-oriented to application oriented dramatically improves application deployment and introspection.\r\n3. Decoupling of image and OS makes it possible to provide the same deployment environment in both development and production, which, in turn, improves deployment reliability and speeds up development by reducing inconsistencies and friction.	f
771	1	What is Chubby?	A distributed lock service (master election) built on Borg.	f
772	1	What does CSP stand for?	Communicating Sequential Processes	f
773	1	What is Protocol buffers?	Protocol buffers (aka protobuf) are Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data. IDL-based.\r\n\r\nYou define how you want your data to be structured once, then you can use special generated source code to easily write and read your structured data to and from a variety of data streams and using a variety of languages.	f
774	1	Why is using Protocol buffers better than pickling?	Python pickling doesn't deal well with schema evolution, and also doesn't work very well if you need to share data with applications written in C++ or Java.	f
775	1	What is gRPC?	It’s an open source framework for RPC by Google. gRPC uses HTTP/2 and Google’s own Protobuf to provide a scalable and low latency communication. With gRPC comes a new version of Protobuf (proto3) for high performance binary serialization which includes new features and is easier to use than its predecessors.	f
776	1	What is Redis?	Redis is an in-memory data structure store, used as database, cache and message broker. It supports data structures such as strings, hashes, lists, sets, sorted sets with range queries, bitmaps, hyperloglogs and geospatial indexes with radius queries. Redis has built-in replication, Lua scripting, LRU eviction, transactions and different levels of on-disk persistence, and provides high availability via Redis Sentinel and automatic partitioning with Redis Cluster.	f
777	1	What commands can be used to make a Redis queue somewhat reliable?	LPUSH\r\nRPOPLPUSH - pop right, pushing onto another list for processing, atomically,\r\nBRPOPLPUSH - same as above, but blocking\r\nRPOP\r\n\r\nRedis is more susceptible to data loss in the event of abrupt termination or power failures.	f
778	1	What is RabbitMQ?	RabbitMQ is a messaging broker - an intermediary for messaging.\r\n\r\nMessages are routed through exchanges before arriving at queues. RabbitMQ features several built-in exchange types for typical routing logic. For more complex routing you can bind exchanges together or even write your own exchange type as a plugin.\r\n\r\nIt can be used as a durable queue, work queues, pub/sub, topic handler, and even for rpc.	f
779	1	What is pika?	Pika is a pure-Python implementation of the AMQP 0-9-1 protocol that tries to stay fairly independent of the underlying network support library. Can use with RabbitMQ.	f
780	1	What is Celery?	Celery is an asynchronous task queue/job queue based on distributed message passing. It is focused on real-time operation, but supports scheduling as well. You use it with a message broker, and it manages the task execution.\r\n\r\nThe execution units, called tasks, are executed concurrently on a single or more worker servers using multiprocessing, Eventlet, or gevent. Tasks can execute asynchronously (in the background) or synchronously (wait until ready).\r\n\r\nThe recommended message broker is RabbitMQ, but support for Redis, Beanstalk, MongoDB, CouchDB, and databases (using SQLAlchemy or the Django ORM) is also available.	f
781	1	What does amqp stand for?	Advanced Message Queuing Protocol	f
782	1	What is ZeroMQ?	A socket-based system, can be used as a queue, pub/sub, etc.\r\n\r\nCarries messages across inproc, IPC, TCP, TIPC, multicast.\r\nSmart patterns like pub-sub, push-pull (pipeline), and router-dealer.	f
783	1	What is ActiveMQ?	Apache ActiveMQ is an open source message broker written in Java.	f
784	1	What is IPC?	Inter-process communication or interprocess communication (IPC) refers specifically to the mechanisms an operating system provides to allow processes it manages to share data. Typically, applications can use IPC categorized as clients and servers, where the client requests data and the server responds to client requests.	f
785	1	What is Kafka?	Apache Kafka is a distributed, partitioned, replicated commit log service. It provides the functionality of a messaging system, but with a unique design.	f
786	1	What is MessagePack?	MessagePack is an efficient binary serialization format. It lets you exchange data among multiple languages like JSON. But it's faster and smaller. Small integers are encoded into a single byte, and typical short strings require only one extra byte in addition to the strings themselves.\r\n\r\nNo IDL.	f
787	1	What is Avro?	Apache Avro is a data serialization system. IDL-based.\r\nRich data structures. \r\nA compact, fast, binary data format. \r\nA container file, to store persistent data. \r\nRemote procedure call (RPC).\r\nCode generation is not required to read or write data files nor to use or implement RPC protocols. Code generation as an optional optimization, only worth implementing for statically typed languages.	f
788	1	What is a Bloom filter?	A Bloom filter is a data structure used to quickly test membership in a set where the number and size of possible elements would be very large. Too large to keep in memory.\r\nA Bloom filter is a space-efficient probabilistic data structure, conceived by Burton Howard Bloom in 1970, that is used to test whether an element is a member of a set. False positive matches are possible, but false negatives are not, thus a Bloom filter has a 100% recall rate. In other words, a query returns either "possibly in set" or "definitely not in set". Elements can be added to the set, but not removed (though this can be addressed with a "counting" filter). The more elements that are added to the set, the larger the probability of false positives.	f
789	1	How can you easily generate multiple hashes for the same element?	Double hashing. This method gives you as many hashes as you need:\r\nhash(x,m) = (hasha(x) + i * hashb(x)) mod m\r\n\r\nIn Python:\r\nimport mmh3\r\nmmh3.hash64('foo') # two 64 bit signed ints, in a tuple\r\nnow you have 2 64-bit hashes. Substituting for i gives you multiple hashes for a Bloom filter.	f
790	1	What is DFT?	Discrete Fourier Transform - converts a finite sequence of equally-spaced samples of a function into an equivalent-length sequence of equally-spaced samples of the discrete-time Fourier transform (DTFT), which is a complex-valued function of frequency.	f
791	1	What is FFTW?	Developed at MIT, it's the Fastest Fourier Transform in the West.	f
792	1	What data structure allows for insert and delete in constant time?	An array, indexed by the value stored. Technically a bit vector.	f
793	1	What is a cache-oblivious algorithm?	A cache-oblivious algorithm does not mean that the algorithm does not take advantage of the cache; to the contrary, it does so quite effectively. What it means is that the algorithm does not need to know the cache line size; it works effectively for all cache line sizes simultaneously, removing the need to tune or optimize for a given machine.\r\n\r\nOptimal cache-oblivious algorithms are known for the Cooley–Tukey FFT algorithm, matrix multiplication, sorting, matrix transposition, and several other problems.	f
794	1	How can you augment a splay tree so you can find how many items are between x and y?	Store size of subtrees at each node. \r\nFind x, splay to root. Each splay, insert, and delete must maintain size in node.\r\nFind y, and along the way add up the sizes in the left subtrees, and 1 for each visited left-hand node.\r\nSplay y to root to ensure balance.	f
795	1	In a maximum flow problem, what is the minimum cut?	The min cut is the maximum flow through the graph.	f
796	1	What is the Ford-Fulkerson algorithm?	The Ford–Fulkerson method or Ford–Fulkerson algorithm (FFA) is a greedy algorithm that computes the maximum flow in a flow network. It is called a "method" instead of an "algorithm" as the approach to finding augmenting paths in a residual graph is not fully specified or it is specified in several implementations with different running times. The name "Ford–Fulkerson" is often also used for the Edmonds–Karp algorithm, which is a specialization of Ford–Fulkerson.	f
797	1	What is the running time for the disjoint set data structure?	Due to merging smaller disjoint sets into larger ones (called union by rank) (during union) and performing path compression (during find), the amortized time per operation is only O(alpha(n)), where alpha(n) is the inverse of the function and A is the extremely fast-growing Ackermann function. Since alpha(n) is the inverse of this function, alpha(n) is less than 5 for all remotely practical values of n. Thus, the amortized running time per operation is effectively a small constant.\r\n\r\nThe worst-case for find() is Theta(log u) where u is the number of unions, and no finds have been done to allow for path compression yet.	f
798	1	In testing, what is an oracle?	Software testers and software engineers can use an oracle as a mechanism for determining whether a test has passed or failed. The use of oracles involves comparing the output(s) of the system under test, for a given test-case input, to the output(s) that the oracle determines that product should have.	f
799	1	What do you test interfaces with a trust boundary?	With lots of different inputs, including random inputs to ensure that the system can handle or appropriately error out, not crash.	f
800	1	What Python flag turns on optimizations and removes assertions from code?	python -O	f
801	1	Why is doing work in a constructor a bad thing?	It can make your code harder to test.	f
802	1	What should be avoided to ensure testing is easier/possible?	- static methods and properties\r\n- final keyword\r\n- use of new in methods (use dependency injection)	f
803	1	What is another name for a setter?	A mutator	f
804	1	What is another name for a getter?	An accessor.	f
805	1	What are some guidelines to keep in mind to not violate the dependency inversion principle?	- No variable should have a concrete class type. An abstract type is better.\r\n- No class should derive from a concrete class.\r\n- No method should override an implemented method of any of its base classes.\r\n\r\nThese are guidelines and may not be feasible all the time.	f
806	1	What is another name for O(2^n)?	Exponential growth	f
807	1	What is another name for O(n^4)?	Quartic growth	f
808	1	What does big-O mean? (briefly)	It never gets as big as this.\r\nGrowth will never be slower as this.	f
809	1	What does big-Omega mean? (briefly)	It's at least as big as this.\r\nGrowth will never be slower as this.	f
810	1	What is a trap/exception?	A special instruction that a program performs to interrupt the process and give control to the kernel.	f
811	1	What does the scheduler do?	Schedulers are special system software which handles process scheduling in various ways. Their main task is to select the jobs to be submitted into the system and to decide which process to run.	f
812	1	What are the 2 hardware modes?	kernel mode and user mode	f
813	1	What is a PCB and what does it have?	Process control block - It holds a complete snapshot of the state of the process.	f
814	1	What is stored in a TCB?	registers\r\nprogram counter\r\nstack counter	f
815	1	What is separate chaining?	In hash table conflict resolution, each bucket is independent and has some sort of linked list of entries with the same index. The time for hash table operations is the time to find the bucket (which is constant) plus the time for the list operation.\r\n\r\nIn a good hash table, each bucket has zero or one entries, and sometimes two or three, but rarely more than that. Therefore, structures that are efficient in time and space for these cases are preferred. Structures that are efficient for a fairly large number of entries per bucket are not needed or desirable. If these cases happen often, the hashing function needs to be fixed.	f
816	1	What is open addressing?	In hash table conflict resolution, all entry records are stored in the bucket array itself. When a new entry has to be inserted, the buckets are examined, starting with the hashed-to slot and proceeding in some probe sequence, until an unoccupied slot is found. When searching for an entry, the buckets are scanned in the same sequence, until either the target record is found, or an unused array slot is found, which indicates that there is no such key in the table. The name "open addressing" refers to the fact that the location ("address") of the item is not determined by its hash value. (This method is also called closed hashing; it should not be confused with "open hashing" or "closed addressing" that usually mean separate chaining.)	f
817	1	What is the length of the longest chain in a hash table using separate chaining?	O(1 + alpha) where alpha is the load factor, n/m.	f
818	1	Since uniform hashing is difficult to achieve in practice, what is a great alternative?	double hashing	f
819	1	How can you test if a number is odd in bitwise operations?	return (x & 1)	f
820	1	How can you test if a number is even in bitwise operations?	return (x & 1) == 0	f
821	1	What order of node and its children are involved in a preorder traversal?	node\r\nleftChild\r\nrightChild	f
822	1	What order of node and its children are involved in a postorder traversal?	leftChild\r\nrightChild\r\nnode	f
823	1	What order of node and its children are involved in an inorder traversal?	leftChild\r\nnode\r\nrightChild	f
824	1	What is another name for a breadth-first search traversal?	Level-order traversal.	f
825	1	Code: Compute the power set of a set of integers S.	How?	f
827	1	Where can octet order (Endianness) problems crop up in files?	In binary files, if you aren't consistent with choosing an order. Files encoded in utf8 or ASCII don't have this issue.	f
828	1	What defines a complete binary tree, and give an example?	The same number of nodes at all levels of the tree, except at leaf level where it fills in left to right. A heap stored as an array is an example.	f
829	1	In a heap, with a 0-based array, what is parent of i?	floor((i-1)/2)	f
830	1	In a heap, with a 0-based array, what is left child of i?	2i + 1	f
831	1	In a heap, with a 0-based array, what is right child of i?	2i + 2	f
832	1	In a heap, with a 1-based array, what is right child of i?	2i + 1	f
833	1	In a heap, with a 1-based array, what is left child of i?	2i	f
834	1	In a heap, with a 0-based array, what is parent of i?	floor(i/2)	f
835	1	What is the height of a m-ary heap?	log base m of n	f
836	1	What is a 2-3-4 tree?	2–3–4 tree (also called a 2–4 tree) is a self-balancing data structure that is commonly used to implement dictionaries. The numbers mean a tree where every node with children (internal node) has either two, three, or four child nodes:\r\n\r\n- 2-node has one data element, and if internal has two child nodes;\r\n- 3-node has two data elements, and if internal has three child nodes;\r\n- 4-node has three data elements, and if internal has four child nodes.	f
837	1	What is the complexity of all operations on a splay tree?	O(log n) on average.\r\nA single operation Theta(n) in the worst case.	f
838	1	What is the maximum height of a red-black tree?	2 log n	f
839	1	In a b-tree, how many children are there per node?	root: 1 to 2t-1 keys\r\nnon-root: t-1 to 2t-1 keys\r\nt could be up to 100, or more.\r\nThere are n keys and n+1 children.\r\nLeaves are all the same level.	f
840	1	What does the max degree of a b-tree depend on?	The number of items being stored, and page size based on disk characteristics.	f
841	1	A b-tree's data is organized to correspond with what?	Pages on disk.	f
842	1	Give an example of how a b-tree might be organized.	1024 children per node.\r\nStore root in memory.\r\n3 nodes accessed gets us 1024^3 disk pages.\r\n4 nodes accessed gets us 1024^4 disk pages.	f
843	1	On descending a b-tree, what's the rule?	Never step into a minimal node.	f
844	1	On insertion in a b-tree, what's the rule?	Never step into a full node.	f
845	1	How many nodes of k leaves are in a compressed trie (big-O)?	O(k) nodes with k leaves due to compression.	f
846	1	What is a suffix tree?	A suffix tree is a compressed trie containing all the suffixes of the given text as their keys and positions in the text as their values. Suffix trees allow particularly fast implementations of many important string operations.\r\n\r\nThe construction of such a tree for the string S takes time and space linear in the length of S. Once constructed, several operations can be performed quickly, for instance locating a substring in S, locating a substring if a certain number of mistakes are allowed, locating matches for a regular expression pattern etc. Suffix trees also provide one of the first linear-time solutions for the longest common substring problem. These speedups come at a cost: storing a string's suffix tree typically requires significantly more space than storing the string itself.	f
847	1	In brief, how does selection sort work?	Find the minimum item on each pass, past the previous minimum, and swap it into the leftmost position after the previous minimum.	f
848	1	When can insertion sort run in n log n time?	Load into a binary search tree. Then inorder traversal.	f
849	1	How can you speed up selection sort with a heap?	Replace the unsorted portion with a min-heap. Gives O(log n) removal. Makes n log n overall.	f
850	1	What data structure is well suited for a heap sort and which is bad?	Array - good\r\nLinked list - clumsy	f
851	1	What data structure is well suited for a merge sort and which is just okay?	Linked list - a natural\r\nArray does not allow for in-place	f
852	1	How can you optimize finding a pivot when the segment to pivot is large (not random choice)?	Choose a median of three.	f
853	1	What is counting sort?	Counting sort is an algorithm for sorting a collection of objects according to keys that are small integers; that is, it is an integer sorting algorithm. It operates by counting the number of objects that have each distinct key value, and using arithmetic on those counts to determine the positions of each key value in the output sequence. Its running time is linear in the number of items and the difference between the maximum and minimum key values, so it is only suitable for direct use in situations where the variation in keys is not significantly greater than the number of items. However, it is often used as a subroutine in another sorting algorithm, radix sort, that can handle larger keys more efficiently.	f
854	1	What is radix sort?	Radix sort is a non-comparative integer sorting algorithm that sorts data with integer keys by grouping keys by the individual digits which share the same significant position and value. \r\nTwo classifications of radix sorts are least significant digit (LSD) radix sorts and most significant digit (MSD) radix sorts. LSD radix sorts process the integer representations starting from the least digit and move towards the most significant digit. MSD radix sorts work the other way around.	f
855	1	What is the counting sort running time?	O(q + n) where q is the number of unique items. If q is in O(n), then linear time.	f
856	1	What radix is most natural to use?	A power of 2 radix.	f
857	1	How would radix sort work for IEEE floating point numbers?	Flip all bits for negative numbers, do sort, then flip back.	f
858	1	How to choose q for radix sort?	Choose q within a power of 2 of n. Ensures the number of passes is small. Best rule is n rounded down to the next power of 2.\r\nTo save memory, round sqrt(n) down to the next power of 2. Twice as many passes.	f
859	1	What operations are a treap optimized for?	- union\r\n- intersection\r\n- difference	f
860	1	What is the Day–Stout–Warren (DSW) algorithm?	The Day–Stout–Warren (DSW) algorithm is a method for efficiently balancing binary search trees — that is, decreasing their height to O(log n) nodes, where n is the total number of nodes. Unlike a self-balancing binary search tree, it does not do this incrementally during each operation, but periodically, so that its cost can be amortized over many operations.	f
861	2	What is the insertion sort algorithm?	for (i = 0; i < n; ++i) {\r\n    j = i;\r\n    while (j > 0 && a[j - 1] > a[j]) {\r\n        swap(a, j, j - 1);\r\n        j -= 1;\r\n    }\r\n}	f
862	1	Is radix sort stable?	Yes.	f
863	1	What is the algorithmic time complexity of radix sort?	O(digits)	f
864	2	Give the code for selection sort.	for (i = 0; i < n; ++i) {\r\n    min_index = i:\r\n    for (j = i; j < n; ++j) {\r\n        if (a[j] < a[min_index]) {\r\n            min_index = j;\r\n        }\r\n    }\r\n    swap(a, i, min_index)\r\n}	f
865	1	All comparison-based sorting is bounded by what complexity?	Omega(n log n)	f
866	1	What do you call a linear ordering of a directed graph of its vertices such that for every directed edge uv from vertex u to vertex v, u comes before v in the ordering?	Topological sort	f
867	1	What is a good method for performing a topological sort?	1. Calculate in-degree for each node. O(v + e)\r\n2. Go through 0s, add to queue.\r\n3. For each item in queue, look at each connection, and decrement in-degree of each, if they got to 0, add to queue, repeat.	f
868	1	How many possible trees are there that span all nodes in a graph?	4^n	f
869	2	What is Prim's algorithm?	def prim(self):\r\n    """\r\n    Returns a dictionary of parents of vertices in a minimum spanning tree\r\n    :rtype: dict\r\n    """\r\n    s = set()\r\n    q = queue.PriorityQueue()\r\n    parents = {}\r\n    start_weight = float("inf")\r\n    weights = {}  # since we can't peek into queue\r\n\r\n    for i in self.get_vertex():\r\n        weight = start_weight\r\n        if i == 0:\r\n            q.put(([0, i]))\r\n        weights[i] = weight\r\n        parents[i] = None\r\n\r\n    while not q.empty():\r\n        v_tuple = q.get()\r\n        vertex = v_tuple[1]\r\n\r\n        s.add(vertex)\r\n\r\n        for u in self.get_neighbor(vertex):\r\n            if u.vertex not in s:\r\n                if u.weight < weights[u.vertex]:\r\n                    parents[u.vertex] = vertex\r\n                    weights[u.vertex] = u.weight\r\n                    q.put(([u.weight, u.vertex]))\r\n\r\n    return parents	f
870	1	What is the time complexity of Prim's algorithm on an adjacency matrix?	O(v^2)	f
871	1	What is the time complexity of Prim's algorithm on an adjacency list and a binary heap?	O(e log v)\r\nderived from:\r\nO((e + v) log v)	f
872	1	What is the time complexity of Prim's algorithm on an adjacency list and a Fibonacci heap?	O(e + v log v)	f
873	2	What is the pseudocode Kruskal's algorithm?	KRUSKAL(G):\r\nA = ∅\r\nforeach v ∈ G.V:\r\n   MAKE-SET(v)\r\nforeach (u, v) in G.E ordered by weight(u, v), increasing:\r\n   if FIND-SET(u) ≠ FIND-SET(v):\r\n      A = A ∪ {(u, v)}\r\n      UNION(u, v)\r\nreturn A	f
874	1	What is the time complexity of Kruskal's algorithm?	O(E log V)\r\nor\r\nO(e log e + e α(v) + v)	f
875	1	What is Kruskal's algorithm?	Kruskal's algorithm is a minimum-spanning-tree algorithm which finds an edge of the least possible weight that connects any two trees in the forest. It is a greedy algorithm in graph theory as it finds a minimum spanning tree for a connected weighted graph adding increasing cost arcs at each step. This means it finds a subset of the edges that forms a tree that includes every vertex, where the total weight of all the edges in the tree is minimized. If the graph is not connected, then it finds a minimum spanning forest (a minimum spanning tree for each connected component).	f
876	1	How can you find the number of connected components?	For each node:\r\n  if node not yet visited, increment component count and do DFS.	f
877	1	How can you get a topological sort with DFS?	Do a DFS, and when each node is being marked as complete, add node to a list.\r\nReverse the list.	f
878	1	How can you check for a cycle with DFS?	for each neighbor node:\r\nif not marked as visited (and is not parent) then DFS\r\nelse it's a cycle	f
879	1	How can you get the strongly connected components of a graph?	1. DFS - calculate the finish times for each node\r\n2. Reverse the edges in the graph\r\n3. Call DFS on nodes in reverse graph in reverse order of finishing times.	f
880	1	How do you reverse the edges in a directed graph represented as an adjacency matrix?	Transpose the matrix, so [i, j] becomes [j, i]	f
881	1	How can you find the shortest path on a DAG?	1. Topological sort\r\n2. follow the topological sort, relaxing edges	f
882	1	How to find the longest path on a weighted DAG?	1. Set all edges to their negative weight.\r\n2. Topological sort \r\n3. follow the topological sort, relaxing edges	f
883	1	What is the diameter of a graph?	The shortest path of the farthest nodes. That is, it is the greatest distance between any pair of vertices. To find the diameter of a graph, first find the shortest path between each pair of vertices. The greatest length of any of these paths is the diameter of the graph.	f
884	1	Under what condition can you not use Djikstra's algorithm?	When the graph contains a negative edge. Can cause a cycle that will be traversed infinitely.	f
885	1	In plain words, how does Kruskal's algorithm work?	1. Create a set T and list for result\r\n2. Make a list of all edges in G\r\n3. Sort edges by weight, from least to greatest.\r\n4. Iterate edges in sorted order.\r\n5. For each edge, if u and v are not in T, add u and v to T, and add edge to result list.	f
886	1	What can most dynamic programming problems be expressed as?	Finding the shortest path in a DAG. Formulating it this way ensures you can solve it in linear or linearithmic time.	f
887	1	What metric can you use to measure the badness of a line in a text justification problem?	(page width - text width)^3\r\nMinimize the sum of the badness of the lines.	f
888	1	How can you tell if a graph is 2-colorable?	If it's bipartite. All trees are bipartite.	f
889	1	What is it called when you have too many base cases in your recursion?	arm's length recursion	f
890	1	What is the base case of a recursion?	The code required to give the solution to the smallest subproblem.	f
891	1	What is the formula for n choose k?	n! / k!(n - k)!	f
892	2	What is the general outline of a backtracking algorithm?	def solve(conf):\r\n    if (no more choices):\r\n        return conf\r\n    \r\n    choices = get_available_choices\r\n\r\n    for choice in choices:\r\n        c = pick one\r\n        if solve(conf using c):\r\n            return true\r\n        unmake choice c\r\n\r\n    return false	f
893	1	What kinds of problems is dynamic programming best suited for?	- optimizing left to right sequences (strings, tree nodes as array, permutations)\r\n- search all possibilities while storing results to avoid recomputing	f
894	1	What is n choose n?	1	f
895	1	What is n choose 1?	n	f
896	1	What is n choose 0?	1	f
897	1	What is the Floyd-Warshall algorithm?	The Floyd–Warshall algorithm is a dynamic programming algorithm for finding shortest paths in a weighted graph with positive or negative edge weights (but with no negative cycles).	f
898	1	What is the Bayes' rule (formula)?	P(A|B) = (P(B|A) * P(A)) / P(B)	f
899	1	How would you calculate P(A|B)?	P(A and B) / P(B)	f
900	1	How would you calculate P(A and B)?	P(A) * P(B)	f
903	1	What is a Markov chain?	A Markov chain consists of states linked by transitions labeled with probabilities. The states do not have to be words. They could represent any state.	f
904	1	Write a function that computes the sqrt(n) using binary search.	How?	f
905	1	What is P(A|A)?	1	f
906	1	At how many items should you expect a collision when hashing among n buckets?	At sqrt(n) the probability is 1/2	f
907	1	What is n/n^2?	1/n	f
908	1	What is the P( ! B ) ?	1 - P(B)	f
909	1	What is the probability of at least 1 H in 3 flips?	1 - P(TTT) = 1 - 1/8 = 7/8	f
910	1	With a fair coin, what is the probability of getting exactly 1 H in 4 flips?	P(HTTT) + P(THTT) + P(TTHT) + P(TTTH) = 1/16 + 1/16 + 1/16 + 1/16 = 4/16 = 1/4	f
911	1	With a fair coin, what is the probability of getting exactly k H in n flips?	(n choose k)/2^n	f
912	1	In what domain are most decision problems (P, Exp, R, outside R)?	Outside R - they are uncomputable	f
913	1	What does it mean when a problem is NP-Hard?	It is as hard as any other problem in NP. A problem X is NP-Hard if every problem Y in NP-Hard reduces to X.	f
914	1	What does it mean to reduce a problem A to a problem B?	Converting the input to algorithm A into input into algorithm B, providing an answer for A.	f
915	1	Is "3-D matching" NP-Complete?	Yes	f
916	1	Is "triple coloring a graph" NP-Complete?	Yes	f
917	1	Is "two coloring a graph" NP-Complete?	No	f
918	1	Is "subset sum" NP-Complete?	Yes	f
919	1	Is "bin packing" NP-Complete?	Yes	f
920	1	Is "vertex cover" NP-Complete?	Yes	f
921	1	Is "set cover" NP-Complete?	Yes	f
922	1	Name some NP-Complete problems.	- tsp\r\n- knapsack problem\r\n- satisfiability\r\n- 3D matching\r\n- tricoloring\r\n- subset sum\r\n- rectangle packing\r\n- bin packing\r\n- vertex cover\r\n- set cover	f
923	1	What is one way of doing approximate traveling salesman?	Select a vertex as root.\r\nBuild a MST.\r\nDo a preorder traversal, store nodes in H.\r\nReturn H (a Hamiltonian cycle)	f
924	1	What suffers from GC pauses?	- long-running processes like servers\r\n- real-time applications like video processing	f
925	1	How can an LRU cache be implemented with a linked list?	When an item is accessed, it moves to the head of the list.\r\nThe trailing items can be overwritten with new items, or removed.	f
926	1	How often are DRAM cells data rewritten?	Every 10ms.	f
927	1	What does Skylake architecture look like?	Skylake: \r\n\r\nL1 Data cache = 32 KB, 64 B/line, 8-WAY. 64 cache lines per cache way\r\nL1 Instruction cache = 32 KB, 64 B/line, 8-WAY. 64 cache lines per cache way\r\nL2 cache = 256 KB, 64 B/line, 4-WAY\r\nL3 cache = 8 MB, 64 B/line, 16-WAY	f
928	1	What is a TLB?	A translation lookaside buffer (TLB) is a cache that memory management hardware uses to improve virtual address translation speed. The majority of desktop, laptop, and server processors includes one or more TLBs in the memory management hardware, and it is nearly always present in any hardware that utilizes paged or segmented virtual memory.	f
929	1	In a direct mapped or set associative cache, what is special about the cache size?	Main memory is divided into pages, and a memory page maps directly to the cache way size. So an item in a cache page can be mapped to any one of 8 cache ways in an 8-way associative cache. A direct mapped cache simply has one cache way, but it works the same way.	f
930	1	How many bits does a SHA1 produce?	160	f
931	1	How many bits does a SHA2 and SHA3 produce?	224 to 512	f
932	1	Is it always letters we are looking for in compression?	No. Hardly.\r\nWe are looking to compress discrete symbols, not letters. If we have a few words, they could be symbols.\r\nWe try to balance longest chains of symbols and the lowest entropy.	f
933	1	What is Zopfli?	Zopfli is data compression software that encodes data into DEFLATE, gzip and zlib formats. It achieves higher compression than other DEFLATE/zlib implementations, but takes much longer to perform the compression. It was first released in February 2013 by Google.	f
934	1	What is the Chinese remainder theorem?	If one knows the remainders of the division of an integer n by several integers, then one can determine uniquely the remainder of the division of n by the product of these integers, under the condition that the divisors are pairwise coprime.	f
935	1	How do you change a 2s complement positive integer into a negative one?	Flip all bits and + 1	f
936	1	How do you change a 2s complement negative integer into a positive one?	Flip all bits and + 1 (same as going the other way)	f
937	1	Which way does the stack grow?	Down to lower memory addresses.	f
938	1	What is polymorphism in OO?	A property of OO in which an abstraction operation may be performed in different ways in different classes, but share an interface.\r\nAlso can mean multiple methods of the same name but different signature.	f
939	1	What are the 4 main tenets of OO?	Abstraction\r\nPolymorphism\r\nInheritance \r\nEncapsulation\r\n\r\na pie (acronym)	f
940	1	What is dynamic binding?	Dynamic binding, also called dynamic dispatch, is the process of linking procedure call to a specific sequence of code (method) at run-time. Dynamic binding is also known as late binding or run-time binding. Dynamic binding is an object oriented programming concept and it is related with polymorphism and inheritance.	f
941	1	What is a package?	A group of classes bundled together.	f
942	1	What is an interface in OO?	Similar to an abstract data type, but simply defines the expected behaviors of a class, but does not suggest an implementation.	f
943	1	What is a framework?	A reusable piece of software that implements a generic solution to a generalized problem. It saves time by being a close model of the problem domain and can reach 100% with details coded by the implementer.	f
944	1	What are hooks?	The portions of a framework that are called, but do nothing and require implementation when needed.	f
945	1	What is a server?	A program that provides a service for other programs to connect to it.	f
946	1	What is an OCL?	Object constraint language. A specification language designed to formally specify constraints in software modules. An OCL expression specifies a logical fact about the system that must remain true.	f
947	1	What is the Chain of Responsibility pattern?	Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request. Chain the receiving objects and pass the request along the chain until an object handles it.	f
1102	1	removeMin (binary heap)	O(log N)	f
948	1	What is the Command pattern?	Encapsulate a request as an object, thereby letting you parameterize clients with different requests, queue or log requests, and support undoable operations.	f
949	1	What design pattern avoids coupling the sender of a request to its receiver by giving more than one object a chance to handle the request?	Chain of Responsibility	f
950	1	What design pattern encapsulates a request as an object, thereby letting you parameterize clients with different requests?	Command pattern	f
951	1	What is the Interpreter pattern?	Given a language, define a representation for its grammar along with an interpreter that uses the representation to interpret sentences in the language.	f
952	1	What design pattern, given a language, defines a representation for its grammar along with an interpreter that uses the representation to interpret sentences in the language?	Interpreter pattern	f
953	1	What is the Iterator pattern?	Provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation.	f
954	1	What design pattern provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation?	Iterator pattern	f
955	1	What is the Mediator pattern?	Defines an object that encapsulates how a set of objects interact. Promotes loose coupling by keeping objects from referring to each other explicitly and it lets you vary their interactions independently.	f
956	1	What design pattern defines an object that encapsulates how a set of objects interact?	Mediator pattern	f
957	1	What is the Memento pattern?	Without violating encapsulation, capture and externalize an object's internal state so that the object can be restore to this state later.	f
958	1	What design pattern captures and externalize an object's internal state so that the object can be restore to this state later?	Memento pattern	f
959	1	What is the Observer pattern?	Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.	f
960	1	What design pattern defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically?	Observer pattern	f
961	1	What is the State pattern?	Allows an object to alter its behavior when its internal state changes. The object will appear to change its class.	f
962	1	What design pattern allows an object to alter its behavior when its internal state changes?	State pattern	f
963	1	What is the Strategy pattern?	Defines a family of algorithms, encapsulates each one, and makes them interchangeable. Lets the algorithm vary independently from clients that use it.	f
964	1	What design pattern defines a family of algorithms, encapsulates each one, and makes them interchangeable, and lets the algorithm vary independently from clients that use it?	Strategy pattern	f
965	1	What is the Template Method pattern?	Defines the skeleton of an algorithm in an operation, deferring some steps to subclasses. Lets subclasses redefine certain steps of an algorithm without changing the algorithm's structure.	f
966	1	What design pattern defines the skeleton of an algorithm in an operation, deferring some steps to subclasses?	Template Method pattern	f
967	1	What is the Visitor pattern?	Represents an operation to be performed on the elements of an object structure. Lets you define a new operation without changing the classes of the elements on which it operates.	f
968	1	What design pattern represents an operation to be performed on the elements of an object structure and lets you define a new operation without changing the classes of the elements on which it operates?	Visitor pattern	f
969	1	What is the Adapter pattern?	Converts the interface of a class into another interface clients expect. Lets classes work together that couldn't otherwise because of incompatible interfaces.	f
970	1	What design pattern converts the interface of a class into another interface clients expect?	Adapter pattern	f
971	1	What is the Bridge pattern?	Decouples an abstraction from its implementation so that the two can vary independently.	f
972	1	What design pattern decouples an abstraction from its implementation so that the two can vary independently?	Bridge pattern	f
973	1	What is the Composite pattern?	Compose objects into tree structures to represent part-whole hierarchies. Lets clients treat individual objects and compositions of objects uniformly.	f
974	1	What design pattern composes objects into tree structures to represent part-whole hierarchies?	Composite pattern	f
975	1	What is the Decorator pattern?	Attaches additional responsibilities to an object dynamically. Provides a flexible alternative to sub-classing for extending functionality.	f
976	1	What design pattern attaches additional responsibilities to an object dynamically and provides a flexible alternative to sub-classing for extending functionality?	Decorator pattern	f
977	1	What is the Facade pattern?	Provides a unified interface to a set of interfaces in a subsystem. Defines a high-level interface that makes the subsystem easier to use.	f
978	1	What design pattern provides a unified interface to a set of interfaces in a subsystem and defines a high-level interface that makes the subsystem easier to use.	Facade pattern	f
979	1	What is the Flyweight pattern?	Uses sharing to support large numbers of fine-grained objects efficiently.	f
980	1	What design pattern uses sharing to support large numbers of fine-grained objects efficiently?	Flyweight pattern	f
981	1	What is the Proxy pattern?	Provides a surrogate or placeholder for another object to control access to it.	f
982	1	What design pattern provides a surrogate or placeholder for another object to control access to it?	Proxy pattern	f
983	1	What is the Abstract Factory pattern?	Provides an interface for creating families of related or dependent objects without specifying their concrete class.	f
984	1	What design pattern provides an interface for creating families of related or dependent objects without specifying their concrete class?	Abstract Factory pattern	f
985	1	What is the Builder pattern?	Separates the construction of a complex object from its representation, so the same construction process can create different representations.	f
986	1	What design pattern separates the construction of a complex object from its representation, so the same construction process can create different representations?	Builder pattern.	f
1103	1	build (binary heap)	O(N)	f
987	1	What is the Factory Method pattern?	(Technically it's an idiom)\r\nDefines an interface for creating an object, but lets subclasses decide which class to instantiate. Lets a class defer instantiation to subclasses.	f
988	1	What design pattern defines an interface for creating an object, but lets subclasses decide which class to instantiate?	Factory method (technically an idiom, not a design pattern)	f
989	1	What is the Prototype pattern?	Specifies the kinds of objects to create using a prototypical instance, and creates new objects by copying this prototype.	f
990	1	What design pattern specifies the kinds of objects to create using a prototypical instance, and creates new objects by copying this prototype?	Prototype pattern	f
991	1	What is the Singleton pattern?	Ensures a class only has one instance and provides a global point of access to it.	f
992	1	What design pattern ensures a class only has one instance and provides a global point of access to it?	Singleton pattern	f
993	1	What are design patterns?	Recurring, reusable solutions to common class and class relationship problems.	f
994	1	What is the Law of Demeter?	Each unit should have only limited knowledge about other units - only units "closely" related to the current unit. Each unit should only talk to friends, not strangers. Only talk to immediate friends.	f
995	1	If a cache line size is 64B, and the memory bus is 64 bits wide, how many transfers per cache line?	8	f
996	1	What does an exclusive cache style?	An eviction from L1D pushes the cache line down into L2, which has the same cache line size. Each eviction is progressively more expensive.	f
997	1	What manufacturer uses an exclusive cache style?	AMD	f
998	1	How does an inclusive cache style work?	Each cache line in L1D is also in L2. This makes L1D eviction faster.	f
999	1	What manufacturer uses an inclusive cache style?	Intel	f
1000	1	What is the Fast Fourier Transform?	A fast Fourier transform (FFT) algorithm computes the discrete Fourier transform (DFT) of a sequence, or its inverse. Fourier analysis converts a signal from its original domain (often time or space) to a representation in the frequency domain and vice versa. An FFT rapidly computes such transformations by factorizing the DFT matrix into a product of sparse (mostly zero) factors.	f
1001	1	What is a skip list?	A data structure that allows fast search within an ordered sequence of elements. Fast search is made possible by maintaining a linked hierarchy of subsequences, with each successive subsequence skipping over fewer elements than the previous one. Searching starts in the sparsest subsequence until two consecutive elements have been found, one smaller and one larger than or equal to the element searched for.\r\n\r\nA skip list is built in layers. The bottom layer is an ordinary ordered linked list. Each higher layer acts as an "express lane" for the lists below, where an element in layer i appears in layer i+1 with some fixed probability p (two commonly used values for p are 1/2 or 1/4).	f
1002	1	What operations does a skip list support and what is their avg and worst case times?	search: O(log n) O(n)\r\ninsert: O(log n) O(n)\r\ndelete: O(log n) O(n)	f
1003	1	What operations does a van Emde Boas tree support and what are the time complexities?	All are O(log log M), where M is the total number of items that can be stored = 2^m\r\nOr O(log m) where m is the actual number of items stored\r\nSpace: O(M)\r\n\r\nSearch\r\nInsert\r\nDelete\r\nPredecessor\r\nSuccessor	f
1004	1	What are the complexities for treap operations?	For all the basic maintenance operations, they are O(log n) average case and O(n) worst case.\r\n- Search\r\n- Insert\r\n- Delete\r\n\r\nFor these operations, O(m log n/m) for treaps of sizes m and n, with m ≤ n. \r\n- union\r\n- intersection\r\n- difference	f
1005	1	What are Catalan numbers?	Catalan numbers form a sequence of natural numbers that occur in various counting problems, often involving recursively-defined objects. They can be thought of as the set of balanced parentheses. \r\nDo not think of Catalan numbers as pseudoprimes. There are only 3 Catalan pseudoprimes.	f
1006	1	What is Karatsuba multiplication?	It reduces the multiplication of two n-digit numbers to at most n^1.585 single-digit multiplications in general (and exactly n^log(base2)3 when n is a power of 2). The Karatsuba algorithm was the first multiplication algorithm asymptotically faster than the quadratic "grade school" algorithm.	f
1007	1	What is the time complexity of Ford-Fulkerson?	O(E max|f|)	f
1008	1	16^0 ?	1	f
1009	1	16^1 ?	16	f
1010	1	16^2 ?	256	f
1011	1	16^3 ?	4096	f
1012	1	16^4 ?	65,536	f
1013	1	16^5 ?	1,048,576	f
1014	1	16^6 ?	16 million	f
1015	1	16^7	268 million	f
1016	1	16^8 ?	4.294 billion, same as 2^32	f
1017	1	What is 0xB in decimal?	11	f
1018	1	What is 0xC in decimal?	12	f
1019	1	What is 0xD in decimal?	13	f
1020	1	What is 0xE in decimal?	14	f
1021	1	What is 0xF in decimal?	15	f
1022	1	What is 0xA in decimal?	10	f
1023	1	What is 0xA in binary?	1010	f
1024	1	What is 0xB in binary?	1011	f
1025	1	What is 0xC in binary?	1100	f
1026	1	What is 0xD in binary?	1101	f
1027	1	What is 0xE in binary?	1110	f
1028	1	What is 0xF in binary?	1111	f
1029	1	How are the priorities of a treap assigned?	Randomly generated upon insertion. That randomness is used to keep the tree balanced.	f
1030	1	Give an example of a proposition in conjunctive normal form.	(A + ~B)(A + B)	f
1031	1	How does a half-adder handle an addition?	XOR for the sum and AND for the carry	f
1032	1	Is a geometric Steiner tree NP-Complete?	Yes	f
1033	1	What are the 2 algorithms for convex hull?	- Graham scan\r\n- Jarvis march (gift-wrapping method)	f
1034	1	How does a Graham scan work in finding convex hull?	At O(n log n), uses a sort and then a simple single pass of all the points, and making only left turns as it goes around the perimeter counter-clockwise. When the next point is a right turn, it backtracks past all points (using a stack and popping points off) until that turn turns into a left turn.	f
1035	1	How does the Jarvis march work in finding convex hull?	Starting with the leftmost point p: \r\nGo through each point to the right of that point, and using p as a pivot, find which point is the most clockwise. O(n)\r\nGet the most clockwise point as the new p - O(1)\r\nLoop again with new p\r\n\r\nThis continues until the starting point is reached O(h) - where h is the number of hull points	f
1036	1	What is the worst case time complexity of a Jarvis march?	O(n^2)\r\nOccurs when most points are part of the hull, and few points contained in the hull.	f
1037	1	What is the average complexity of a Jarvis march?	O(n * h) where h is the number of points that compose the hull.	f
1038	1	What is white-box testing?	The tester is using knowledge of the program's internals.	f
1039	1	What is black-box testing?	The tester is testing without knowledge of the internals.	f
1040	1	What is unit testing?	Testing a single module in isolation.	f
1041	1	What can affect testing, apart from API inputs?	- timing of inputs\r\n- disk full\r\n- network latency\r\n- network failures	f
1042	1	What are 3 situations where timing of inputs important in testing?	- when SUT interacts directly with hardware devices\r\n- when SUT interfaces with other machines on the network\r\n- SUT is multithreaded	f
1043	1	What is a mock object?	An object used to replicate the interfaces and interactions of a larger system that can be bolted on to the SUT.	f
1044	1	What is integration testing?	Testing units together to ensure the integrated behavior performs as expected.	f
1045	1	What is system testing?	- not concerned with internals\r\n- does system as a while perform acceptably for the important use cases	f
1046	1	What is differential testing?	Running test inputs into 2 different implementations and then testing for equality. This is useful for testing multiple versions of the software.	f
1047	1	What is stress testing?	Testing code or a system beyond its normal usage.\r\nTesting large inputs.\r\nTesting many requests.	f
1048	1	How can you tell you're testing enough?	Code coverage metrics (of which there are a few)	f
1049	1	What does code coverage not tell you?	- missing errors of omission\r\n- code that misses a specification item\r\n- does not tell us that code looped the correct number of times	f
1050	1	What should you do when you discover that not all code is covered?	Don't blindly write tests to cover all cases.\r\nRethink the tests. Perhaps they are interpreting the functionality incorrectly.	f
1051	1	What are some coverage metrics?	- line coverage\r\n- statement coverage (multiple statements on a line)\r\n- branch coverage\r\n- mc/dc coverage\r\n- loop coverage	f
1052	1	What is mc/dc coverage?	modified condition / decision\r\n\r\n- Required for certain types of avionics software\r\n- Tests every possible branch and condition	f
1053	1	What is path coverage?	Coverage that is concerned with the paths taken to arrive at a place in the code.	f
1054	1	What is infeasible code?	Code that can never be true.\r\nInfeasible code is code that is either not forward- or not backward-reachable. Infeasible code is not necessarily an error but it is a good indicator that something is wrong with the code and, e.g., in avionics, infeasible code is forbidden by current standards.	f
1055	1	Should you include integration tests in code coverage metrics?	No	f
1056	1	What should you do before fixing a reported bug?	Write a test. Avoiding this practice allows bugs to re-appear.	f
1057	1	Why should tests be idempotent and isolated?	It allows tests to be run in any order, re-run, and parallelized.	f
1058	1	delete (unordered singly linked list)	O(n)	f
1059	1	find (unordered singly linked list)	O(n)	f
1060	1	delete (ordered singly linked list)	O(n)	f
1061	1	find (Binary Search Tree)	O(h)	f
1062	1	add (Binary Search Tree)	O(h)	f
1063	1	Add element to the top of the stack - push	O(1)	f
1064	1	Remove the top element of the stack - pop	O(1)	f
1065	1	Return the value of the top element of the stack without removing it.	O(1)	f
1066	1	Add an element to a queue.	O(1)	f
1067	1	Remove an element from the front of the queue. dequeue	O(1)	f
1068	1	Return the element from the front of the queue without removing it. - front	O(1)	f
1069	1	find (unordered array)	O(n)	f
1070	1	add (unordered array)	O(1)	f
1071	1	delete (unordered array)	O(N)	f
1072	1	find (sorted array)	O(log n)\r\nbinary search	f
1073	1	add (sorted array)	O(n)	f
1074	1	delete an element from a sorted array	O(N)	f
1075	1	find (unordered singly linked list)	O(N)	f
1076	1	add (unordered singly linked list)	O(1)	f
1077	1	delete (unordered singly linked list)	O(N)	f
1078	1	find (ordered singly linked list)	O(N)	f
1079	1	add (ordered singly linked list)	O(N)	f
1080	1	delete (ordered singly linked list)	O(N)	f
1081	1	find (Binary Search Tree)	O(h)	f
1082	1	add (Binary Search Tree)	O(h)	f
1083	1	delete (Binary Search Tree)	O(h)	f
1084	1	find (Balanced Binary Search Tree)	O(log N)	f
1085	1	add (Balanced Binary Search Tree)	O(log N)	f
1086	1	delete (Balanced Binary Search Tree)	O(log N)	f
1087	1	find (Balanced Binary Search Tree)	O(log N)	f
1088	1	add (Balanced Binary Search Tree)	O(log N)	f
1089	1	delete (Balanced Binary Search Tree)	O(log N)	f
1090	1	What is a skip list?	A data structure for storing a sorted list of items using a hierarchy of linked lists that connect increasingly sparse subsequences of the items.\r\nO(log N) expected time for all operations, O(N) worst case.	f
1091	1	What is a treap?	Tree + heap\r\nA random priority is assigned to every key and must maintain two properties:\r\n- They are in order with respect to their keys, as in a typical binary search tree\r\n- They are in heap order with respect to their priorities, that is, no key has a key of lower priority as an ancestor\r\nO(log N) expected time for all operations, O(N) worst case.	f
1092	1	What is a max-heap?	A queue in which each element has a "priority" assigned to it. Elements with higher priorities are served before lower priorities.	f
1093	1	min (unordered sequence)	O(N)	f
1094	1	insert (unordered sequence)	O(1)	f
1095	1	removeMin (unordered sequence)	O(N)	f
1096	1	min (ordered sequence)	O(1)	f
1097	1	insert (ordered sequence)	O(N)	f
1098	1	removeMin (ordered sequence)	O(1)	f
1099	1	build (ordered sequence)	O(N log N)	f
1100	1	min (binary heap)	O(1)	f
1104	1	What is a binary heap?	A collection of keys arranged in a complete heap-ordered binary tree, represented in level order in an array (not using the first entry). The parent of the node in position k is in position [k/2] and the two children of the node in position k are in position 2k and 2k+1.	f
1105	1	What is a Adaptable Priority Queue?	A priority queue that allows you to change the priority of objects already in the queue.	f
1106	1	What is the time complexity of quicksort?	O(N^2 worst)\r\nO(N log N) - best & expected	f
1107	1	Lower Bound for Comparison Based Sorting	No comparison based sorting algorithm can be faster than O(N log N)	f
1108	1	k-th smallest (full heap)	Put all values in, do k removeMin operations: O(N + k log N)	f
1109	1	What is a connected graph?	There exists a path from every vertex to every other vertex in the graph.	f
1110	1	What is a tree?	An acyclic connected graph.	f
1111	1	What is a cycle?	Path with at least one edge whose first and last vertices are the same.	f
1112	1	What is a spanning tree?	A subgraph that contains all of that graph's vertices and a single tree.	f
1113	1	Space required for an adjacency list	O(E + V)	f
1114	1	is_adjacent (u,v) (adjacency matrix)	O(degree(u))	f
1115	1	What is the complexity of an adjacency list DFS?	O(E)	f
1116	1	What is another name for a Min-Cost Spanning Tree?	minimum spanning tree	f
1117	1	Bitwise: Isolate the lowest bit that is 1 in x	x & ~(x - 1)	f
1118	1	Bitwise: Replace the lowest bit that is 1 with 0	x & (x - 1)	f
1119	1	Bitwise: Right propagate the rightmost set bit in x	x | (x & ~(x - 1) - 1)	f
1120	1	What are heuristics?	Any approach to problem solving, learning, or discovery that employs a practical method not guaranteed to be optimal or perfect, but sufficient for the immediate goals. Where finding an optimal solution is impossible or impractical, heuristic methods can be used to speed up the process of finding a satisfactory solution. Heuristics can be mental shortcuts that ease the cognitive load of making a decision. Examples of this method include using a rule of thumb, an educated guess, an intuitive judgment, stereotyping, profiling, or common sense	f
1121	1	What is stable sorting?	Items with the same key are sorted based on their relative position in the original permutation	f
1122	1	What is another name for a trie?	Prefix tree or a radix tree.	f
1123	1	What is internal sorting?	An internal sort is any data sorting process that takes place entirely within the main memory of a computer. This is possible whenever the data to be sorted is small enough to all be held in the main memory. For sorting larger datasets, it may be necessary to hold only a chunk of data in memory at a time, since it won't all fit. The rest of the data is normally held on some larger, but slower medium, like a hard-disk. Any reading or writing of data to and from this slower media can slow the sortation process considerably.	f
1124	1	What is external sorting?	External sorting is a term for a class of sorting algorithms that can handle massive amounts of data. External sorting is required when the data being sorted do not fit into the main memory of a computing device (usually RAM) and instead they must reside in the slower external memory (usually a hard drive). External sorting typically uses a hybrid sort-merge strategy. In the sorting phase, chunks of data small enough to fit in main memory are read, sorted, and written out to a temporary file. In the merge phase, the sorted subfiles are combined into a single larger file.\r\n\r\nMergesort is typically preferred.	f
1125	1	What are 2 advantages of merge sort?	- suitable for a linked list\r\n- suitable for external sort	f
1126	1	What is disadvantages of merge sort?	Need an extra buffer to hold the merged data	f
1127	1	What are 3 advantages of heap sort?	- don't need recursion\r\n- suitable for large data\r\n- locality of data	f
1128	1	What is a disadvantage of heap sort?	Usually slower than merge sort and quick sort.	f
1129	1	What is a articulation vertex?	The weakest point in a graph.	f
1130	1	What is the chromatic number?	The smallest number of colors needed for an edge coloring of a graph.	f
1131	1	What are long-term issues involved in machine learning?	- technical debt\r\n- lack of clear abstraction barriers \r\n- changing anything changes everything\r\n- feedback loop - usage based on your model changes the model\r\n- attractive nuisance (using a successful model in one domain where it doesn't fit in another)\r\n- non-stationarity - stick with current data, or get new, and how much of old data to reuse\r\n- tracking data dependencies - where did the data come from, how to get new data	f
1132	1	How many rows are in a 12 x 16 matrix?	12	f
1133	1	How many columns are in a 12 x 16 matrix?	16	f
1134	1	In linear algebra a vector of 12 elements has how many rows?	12	f
1135	1	In linear algebra a vector of 12 elements has how many columns?	1	f
1136	1	In linear algebra a 12-dimensional vector has how many rows?	12	f
1137	1	In linear algebra a vector of 12-dimensional vector has how many columns?	1	f
1138	1	When multiplying a 4x3 matrix and a 3x6 matrix, what are the dimensions of the final matrix?	4x6	f
1139	1	Can you multiply a 3x2 and a 2x3 matrix?	Yes	f
1140	1	Can you multiply a 3x2 and a 3x2 matrix?	No	f
1141	1	Can you multiply a 3x2 and a 2x6 matrix?	Yes	f
1142	1	When multiplying a 5x2 matrix and a 2x5 matrix, what are the dimensions of the final matrix?	5x5	f
1143	1	Is matrix multiplication commutative? Does AxB = BxA?	No.	f
1144	1	Is matrix multiplication associative? Does (AxB)xC = Ax(BxC)?	Yes	f
1145	1	What would the identity matrix look like to multiply with an MxN matrix to get itself?	An NxN matrix that is all zeroes except it has 1s on a top-left to bottom-right diagonal.	f
1146	1	What must at least be true about a matrix for it to have an inverse?	It must be square.	f
1147	1	What does it mean to invert a matrix?	Multiplying it by a specific matrix so that the product is the identity matrix.	f
1148	1	What Python library computes the inverse of a matrix?	numpy.linalg.inv\r\nor\r\nnumpy.linalg.pinv which can solve when the matrix is non-invertible	f
1149	1	What are 2 words for matrices that are invertible?	- singular\r\n- degenerate	f
1150	1	If A is a matrix and Aij is the ith row, jth column, what is the traspose B?	Bji	f
1151	1	What is another name for quadratic?	2nd-order polynomial	f
1152	1	What is supervised learning?	Supervised learning is the machine learning task of inferring a function from labeled training data. The training data consist of a set of training examples. In supervised learning, each example is a pair consisting of an input object (typically a vector) and a desired output value (also called the supervisory signal).	f
1153	1	What is a regression problem?	One that predicts a continuously valued output. May refer specifically to the estimation of continuous response variables, as opposed to the discrete response variables used in classification.	f
1154	1	What is a classification problem?	The problem of identifying to which of a set of categories (sub-populations) a new observation belongs, on the basis of a training set of data containing observations (or instances) whose category membership is known.	f
1155	1	What is unsupervised learning?	Unsupervised learning is the machine learning task of inferring a function to describe hidden structure from unlabeled data. Since the examples given to the learner are unlabeled, there is no error or reward signal to evaluate a potential solution. This distinguishes unsupervised learning from supervised learning and reinforcement learning.	f
1156	1	What are the 2 types of problems that utilize supervised learning?	Regression and classification	f
1157	1	In machine learning, what is the symbol m used for?	the number of training examples.	f
1158	1	What is another term for linear regression with one variable?	Univariate linear regression	f
1159	1	What is gradient descent?	Gradient descent is a first-order iterative optimization algorithm. To find a local minimum of a cost function using gradient descent, one takes steps proportional to the negative of the gradient (partial derivative or tangent) of the function at the current point.	f
1160	1	What is it called when all training examples are used to calculate gradient descent?	batch gradient descent	f
1161	1	What is another term for linear regression with multiple variables?	Multivariate linear regression	f
1162	1	Why is feature scaling important?	Without feature scaling, it can take gradient descent much longer to find the local minimum. The function may oscillate in small movements for much longer.	f
1163	1	What is is good range to scale features down to?	-1 to +1, or Ng's range: -3 to +3	f
1164	1	What is mean normalization?	A method of scaling a feature's values so that they all fall within a range relative to each other.	f
1165	1	What is a good range for mean normalization?	-0.5 to +0.5	f
1166	1	How can you calculate mean normalization over a set of features?	for each x: xi = (xi - avg(x)) / (max_x - min_x)\r\n\r\n(max_x - min_x) can be replaced with the standard deviation	f
1167	1	Given a sufficiently small alpha, what can you expect from gradient descent?	That it will eventually converge.	f
1168	1	What does Andrew Ng use to find an appropriate alpha for gradient descent?	0.001\r\n0.003\r\n0.01\r\n0.03\r\n0.1\r\n0.3\r\n1	f
1169	1	How can you get your data to fit better using higher order terms in linear regression?	You can take the data and square it, cube it, etc. \r\n\r\nx1 = (somevalue)^2\r\nx7 = (somevalue)^4\r\n\r\nThis is applied to data, not the function. The function still is theta1*x1 + theta2*x2, etc	f
1170	1	What can affect invertibility in a matrix?	- 2 more more features are linearly dependent or redundant (size in meters and size in ft) - remove redundant features\r\n- too few training examples (m) to features (n): m <= n  (remove some features or use regularization)	f
1171	1	When can we use the normal equation instead of gradient descent to minimize J(theta)?	- when we have fewer than 10,000 features\r\n- have to ensure invertibility	f
1172	1	What does numpy.allclose() do?	Returns True if two arrays are element-wise equal within a tolerance.	f
1173	1	Is feature scaling needed when using the normal equation?	No	f
1174	1	What is the normal equation?	An equation that can minimize J(theta), solving for theta, instead of using gradient descent.\r\n\r\nAlso called ordinary least squares (OLS) or linear least squares, it's a method for estimating the unknown parameters in a linear regression model, with the goal of minimizing the sum of the squares of the differences between the observed responses in the given dataset and those predicted by a linear function of a set of explanatory variables.	f
1175	1	What Python determines the pseudo-inverse of a matrix?	numpy.linalg.pinv	f
1176	1	What is treated as false in Python?	• False\r\n• None\r\n• [] (an empty list)\r\n• {} (an empty dict)\r\n• ""\r\n• set()\r\n• 0\r\n• 0.0	f
1177	1	What is a dot product?	The dot product of two vectors is the sum of their componentwise products.\r\nv_1 * w_1 + ... + v_n * w_n	f
1178	1	What is the quantile?	The number at a given percentile of the data.	f
1179	1	What is the mode?	Most-common value(s) in a set of data. Could have more than one if there are 2 subsets with the same number of values.	f
1180	1	What is dispersion?	Dispersion refers to measures of how spread out our data is. Typically they’re statistics for which values near zero signify not spread out at all and for which large values (whatever that means) signify very spread out.	f
1181	1	What is covariance?	The mean value of the product of the deviations of two variates from their respective means.	f
1182	1	What is a random variable?	A random variable is a variable whose possible values have an associated probability distribution.\r\n\r\nA very simple random variable equals 1 if a coin flip turns up heads and 0 if the flip turns up tails. A more complicated one might measure the number of heads observed when flipping a coin 10 times or a value picked from range(10) where each number is equally likely.	f
1183	1	What is PCA and what is it used for?	Principal component analysis. We use it to extract one or more dimensions that capture as much of the variation in the data as possible.	f
1184	1	What is a model?	A specification of a mathematical (or probabilistic) relationship that exists between different variables.	f
1185	1	What is machine learning?	Creating and using models that are learned from data.	f
1186	1	What is the degree of a vertex?	The number of edges incident of the vertex, with loops counted twice.	f
1187	1	What is quick select?	A selection algorithm to find the kth smallest element in an unordered list. Quickselect uses the same overall approach as quicksort, choosing one element as a pivot and partitioning the data in two based on the pivot, accordingly as less than or greater than the pivot. However, instead of recursing into both sides, as in quicksort, quickselect only recurses into one side - the side with the element it is searching for. This reduces the average complexity from O(n log n) to O(n).	f
1188	1	What is preemption?	Preemption is the act of temporarily interrupting a task being carried out by a computer system, without requiring its cooperation, and with the intention of resuming the task at a later time. Such a change is known as a context switch.	f
1189	1	What is an inverted index?	An index data structure storing a mapping from content, such as words or numbers, to its locations in a database file, or in a document or a set of documents (named in contrast to a Forward Index, which maps from documents to content). The purpose of an inverted index is to allow fast full text searches, at a cost of increased processing when a document is added to the database.	f
1190	1	What is set partition?	A partitioning of elements of some universal set into a collection of disjointed subsets. Thus, each element must be in exactly one subset.	f
1191	1	What is a maximum spanning tree?	A spanning tree of a weighted graph having maximum weight. It can be computed by negating the edges and running either Prim's or Kruskal's algorithms.	f
1192	1	What is a minimum product spanning tree and when would you use it?	The cost of a tree is the product of all the edge weights in the tree, instead of the sum of the weights. Since log(a*b) = log(a) + log(b), the minimum spanning tree on a graph whose edge weights are replaced with their logarithms gives the minimum product spanning tree on the original graph.\r\nYou would use it to minimize the product.	f
1193	1	What is a rolling hash?	A rolling hash (also known as a rolling checksum) is a hash function where the input is hashed in a window that moves through the input.\r\n\r\nOne of the main applications is the Rabin-Karp string search algorithm, which uses the rolling hash.	f
1194	2	What is the Euclidean GCD algorithm in Python?	def gcd(a, b):\r\n    while a:\r\n        b, a = a, b % a\r\n    return b	f
1195	1	What is the Rabin-Karp algorithm?	Compute hash codes of each substring whose length is the length of s, such as a function with the property that the hash code of a string is an additive function of each individual character. Get the hash code of a sliding window of characters and compare if the hash matches.	f
1196	1	What is sharding?	Sharding is a type of database partitioning that separates very large databases the into smaller, faster, more easily managed parts called data shards.	f
1197	1	What is von Neumann Architecture?	A model for modern computer organization created by John von Neumann, that had two main features:\r\n1) Both data & instructions are stored in the same place\r\n2) Units that store information are different from units that process information	f
1198	1	What is the fetch-execute cycle?	A 4 part system that describes how actions are performed in the CPU. There are 4 parts to this cycle:\r\n1) Fetch instructions\r\n2) Decode instructions\r\n3) Get data if needed\r\n4) Execute the instructions	f
1199	1	What does a Control Unit (CU) do?	Controls, organizes and deals with all the process and instruction the CPU receives. It is also in charge of the Fetch-Execute Cycle. Has two special purpose registers: the Instruction Register and the Program Counter.	f
1200	1	What is the time complexity of breadth-first search?	O(m + n) \r\nuses queue	f
1201	1	What is the time complexity of breadth-first search?	O(m + n) \r\nuses stack	f
1202	1	What is the time and space complexity of minimum edit distance using dynamic programming?	Time O(mn)\r\nSpace O(mn)	f
1203	1	What is the time complexity of Floyd-Warshall?	Theta(n^3)	f
1204	1	What is the log of n! ?	n log n	f
1205	1	What is the time and space complexity of Bellman-Ford?	Time : O (|V| |E|) or Theta(n^3) \r\nSpace: O (|V|)	f
1206	1	What is the Bellman–Ford algorithm?	An algorithm that computes shortest paths from a single source vertex to all of the other vertices in a weighted digraph. It is slower than Dijkstra's algorithm for the same problem, but more versatile, as it is capable of handling graphs in which some of the edge weights are negative numbers.	f
1207	1	What is a Hamiltonian cycle?	Given an undirected graph G = (V, E), does there exist a simple\r\ncycle Γ that contains every node in V ?\r\nCertificate is a permutation of the n nodes, contain each node in v exactly once, there is an edge btw each pair of adj nodes in the permutation.	f
1208	1	What is the set cover problem?	Given a set U of elements, a collection S1, S2, ..., Sm of subsets of\r\nU, and an integer k, does there exist a collection of ≤ k of these sets whose union is equal to U ?	f
1209	1	What is the time and space complexity of heapsort?	O(n lg n) time\r\nO(1) space	f
1210	1	What is the time and space complexity of merge sort?	O(n lg n) time\r\nO(n) space	f
1211	1	How would you divide up a data set for training and testing?	Split your data set, so that two-thirds of it is used to train the model, after which we test/measure the model’s performance on the remaining third.	f
1212	1	How would you split up a data set in order to choose from multiple models?	In such a situation, you should split the data into three parts: a training set for building models, a validation set for choosing among trained models (called the cross-validation set), and a test set for judging the final model.	f
1213	1	What is a Type 1 error?	A false positive	f
1214	1	What is a Type 2 error?	A false negative	f
1215	1	In statistics, how would you calculate precision?	true_pos / (true_pos + false_pos)	f
1216	1	In statistics, how would you calculate recall?	true_pos / (true_pos + false_neg)	f
1217	1	In statistics, what does precision measure?	Precision measures how accurate our positive predictions are.	f
1218	1	In statistics, what does recall measure?	Recall measures what fraction of the positives our model identified.	f
1219	1	How would you calculate the F1 score?	2 * precision * recall / (precision + recall)	f
1220	1	What is another name for the F1 score?	the harmonic mean of precision and recall	f
1221	1	What is the trade-off between precision and recall?	A model that predicts “yes” when it’s even a little bit confident will probably have a high recall but a low precision; a model that predicts “yes” only when it’s extremely confident is likely to have a low recall and a high precision.\r\n\r\nAlternatively, you can think of this as a trade-off between false positives and false negatives. Saying “yes” too often (high recall) will give you lots of false positives; saying “no” too often will give you lots of false negatives (high precision).	f
1222	1	High bias and low variance typically correspond to _______.	underfitting	f
1223	1	Low bias but very high variance typically correspond to _______.	overfitting	f
1224	1	What can you do when your model has high bias (which means it performs poorly even on your training data)?	One thing to try is adding more features.	f
1225	1	What can you do if your model suffers from overfitting due to high variance?	You can remove features. Another solution is to obtain more training examples (if you can).\r\nOr use regularization.	f
1226	1	What does BFGS stand for?	Broyden–Fletcher–Goldfarb–Shanno algorithm	f
1227	1	What is L-BFGS?	Limited-memory BFGS (L-BFGS or LM-BFGS) is an optimization algorithm in the family of quasi-Newton methods that approximates the Broyden–Fletcher–Goldfarb–Shanno (BFGS) algorithm using a limited amount of computer memory. It is a popular algorithm for parameter estimation in machine learning.	f
1228	1	What are some alternative algorithms that can optimize for a logistic regression problem?	- conjugate gradient\r\n- BGFS\r\n- L-BGFS	f
1229	1	What makes neural networks superior over regression or classification?	Each hidden layer learns its own features instead of being given features.	f
1230	1	How should you initialize Theta for a neural network?	Initialize as a matrix of random reals between 0 and 1. Constrain within a range of +/- epsilon using Theta * 2*epsilon - epsilon.	f
1231	1	What are the number of neurons (units) at the input layer of a neural network?	The number of features.	f
1232	1	What are the number of neurons (units) at the output layer of a neural network performing classification?	The number of classes you are classifying.	f
1233	1	How many hidden layers should there be in a neural network?	Start with 1 as a default, and if more than one, have the same number of units at each layer. The more the better. The number of units in each hidden layer should be more than, or a multiple of, the input units.	f
1234	1	Machine learning: What tends to happen with the training error in a linear model as the degree of polynomial increases?	The error decreases, but too high a degree of polynomial will cause overfitting.	f
1235	1	Machine learning: What tends to happen with the cross-validation error in a linear model as the degree of polynomial increases?	It starts high (high bias) and decreases, reaching a minimum, and then increases (high variance).	f
\.


--
-- Name: public; Type: ACL; Schema: -; Owner: kshilovskiy
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM kshilovskiy;
GRANT ALL ON SCHEMA public TO kshilovskiy;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
