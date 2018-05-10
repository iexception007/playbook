#!/usr/bin/env bash

#  docker exec rabbitmq rabbitmqctl cluster_status | awk 'NR>1' 
# {running_nodes,['rabbit@dev-3','rabbit@dev-2','rabbit@dev-1']},

#curl -sS -u wise2c:wise2c -H "content-type:application/json" http://localhost:15672/api/nodes | jq '.[] | select(.running == true) | .name' | wc -l
# <--- 3
#curl -sS -u wise2c:wise2c http://localhost:15672/api/vhosts 
# <--- [{"cluster_state":{"rabbit@dev-2":"running","rabbit@dev-3":"running","rabbit@dev-1":"running"},"tracing":false,"name":"/"}]

sleep $1

START=1
END=10

for (( i=$START; c<=$END; c++ ))
do
    output=`curl -sS -u wise2c:wise2c -H "content-type:application/json" http://localhost:15672/api/vhosts 2>/dev/null`
    if [[ $? -ne 0 ]]; then
        sleep 1
        continue
    fi

    ret=`echo ${output} | jq '.[].cluster_state | to_entries' | grep "running" | wc -l`
    if [[ $ret -eq 3 ]]; then
        printf true
        exit 0
    fi
    sleep 1
done

printf false