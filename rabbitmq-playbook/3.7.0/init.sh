#! /bin/bash

set -e

path=`dirname $0`
version=$1

image=rabbitmq:3.7.2-management

#echo "" >> ${path}/group_vars/rabbitmq.yml
#echo "image: ${image}" >> ${path}/group_vars/rabbitmq.yml

docker pull ${image}
docker save ${image} > ${path}/file/rabbitmq.tar
bzip2 -z --best ${path}/file/rabbitmq.tar