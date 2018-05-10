#!/usr/bin/env bash

#  docker exec rabbitmq rabbitmqctl cluster_status | awk 'NR>1' 
# {running_nodes,['rabbit@dev-3','rabbit@dev-2','rabbit@dev-1']},

sleep $1

#curl -sS -u wise2c:wise2c -H "content-type:application/json" http://localhost:15672/api/nodes | jq '.[] | select(.running == true) | .name' | wc -l
# <--- 3
#curl -sS -u wise2c:wise2c http://localhost:15672/api/vhosts 
# <--- [{"cluster_state":{"rabbit@dev-2":"running","rabbit@dev-3":"running","rabbit@dev-1":"running"},"tracing":false,"name":"/"}]

ret=`curl -sS -u wise2c:wise2c -H "content-type:application/json" http://localhost:15672/api/vhosts | jq '.[].cluster_state | to_entries' | grep "running" | wc -l`
if [[ ret -eq 3 ]]; then
printf true
else
printf false
fi



