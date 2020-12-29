#!/bin/bash

MAX_ITEMS=10

ecs-list-task-def()
{
	NEXT_TOKEN=$1
	if [ "${NEXT_TOKEN}" == "" ]; then
		RESPONSE=$(
			aws ecs list-task-definitions \
			--max-items "${MAX_ITEMS}"
		)
	else
		RESPONSE=$(
			aws ecs list-task-definitions \
			--max-items "${MAX_ITEMS}" \
			--starting-token "${NEXT_TOKEN}"
		)
	fi

	echo $RESPONSE \
	| jq -r '.taskDefinitionArns[]'
	
	NEXT_TOKEN=$(echo "${RESPONSE}" | jq -r '.NextToken')
	if [ "${NEXT_TOKEN}" != "null" ]; then
		ecs-list-task-def "${NEXT_TOKEN}"
	fi
}

ecs-list-task-def ""
