#! /bin/bash

set -e

path=`dirname $0`
version=$1

image=progrium/consul:latest

echo "" >> ${path}/group_vars/consul.yml
echo "image: ${image}" >> ${path}/group_vars/consul.yml

docker pull ${image}
docker save ${image} > ${path}/file/consul.tar
bzip2 -z --best ${path}/file/consul.tar