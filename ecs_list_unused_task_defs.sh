#!/bin/bash

ALL_TASKS=$1
RUNNING_TASKS=$2

cat <(cat $ALL_TASKS |sort -u) <(join <(cat $ALL_TASKS | sort -u) <(cat $RUNNING_TASKS | sort -u) ) | sort | uniq -u
