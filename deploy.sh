awsRegion='eu-central-1'
containerName='flash-cards'
containerRepository='800532562975.dkr.ecr.eu-central-1.amazonaws.com/flash-cards'
taskDefinitionFile='task-definition.json'
taskDefinitionName='console-sample-app-static'
serviceName='flash-cards-3'


echo 'build docker image...'
docker build -t $containerName .

echo 'upload docker image...'
docker tag $containerName:latest $containerRepository:latest
docker push $containerRepository:latest

echo 'stop current task'
current_task=`aws ecs list-tasks --query 'taskArns[0]'`
aws ecs --task stop-task $current_task

echo 'update task definition...'
aws ecs register-task-definition --cli-input-json file://$taskDefinitionFile --region $awsRegion > /dev/null

echo 'update our service with that last task..'
aws ecs update-service --service $serviceName --task-definition $taskDefinitionName --region $awsRegion  > /dev/null
