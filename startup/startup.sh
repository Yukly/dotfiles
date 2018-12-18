#!/bin/bash

COMMENT=【`date "+%Y-%m-%d (%a)"`】
IFS=">"
AA=(`sed -e "s/__DATE__/$COMMENT/g" ~/startup/startup.txt`)
NUM=${#AA[*]}
NO=`expr $RANDOM % $NUM`
echo ${AA[$NO]}
