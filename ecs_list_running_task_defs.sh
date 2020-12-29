#!/bin/bash

aws ecs list-clusters \
| jq -r '.clusterArns[]' \
| while read ECS_CLUSTER; do
	#echo $ECS_CLUSTER
	aws ecs list-services --cluster $ECS_CLUSTER \
	| jq -r '.serviceArns[]' \
	| while read ECS_SERVICE; do
		aws ecs describe-services --cluster $ECS_CLUSTER --services $ECS_SERVICE \
		| jq -r '.services[].taskDefinition'
	done
done
