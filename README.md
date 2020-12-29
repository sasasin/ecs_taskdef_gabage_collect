# ecs_taskdef_gabage_collect
Gabage Collect shell scripts for AWS ECS Task definition

# How to use

Listup all ECS task definitions.

```
$ ./ecs_list_all_task_defs.sh > all_task_def.txt
```

Listup running ECS task definitions.

```
$ ./ecs_list_running_task_defs.sh > running_task_def.sh
```

Listup unused ECS task definitions.

```
$ ./ecs_list_unused_task_defs.sh all_task_def.sh running_task_def.sh > unused_task_def.txt
```

DeRegister ECS task definitions.

```
$ ./ecs_deregister_unused_task_def.sh unused_task_def.sh
```

# Pre require

* AWS CLI v1 or v2.
* jq
* generic shell commands
    * bash
    * cat
    * sort
    * join
