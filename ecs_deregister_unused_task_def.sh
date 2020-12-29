#!/bin/bash
UNUSED_TASKS=$1
cat $UNUSED_TASKS \
| while read UNUSED_TASK; do
	aws ecs deregister-task-definition \
		--task-definition $UNUSED_TASK
done
