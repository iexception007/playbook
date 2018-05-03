#! /bin/bash

set -e

path=`dirname $0`
version=$1

image=redis:${version}-alpine

echo "" >> ${path}/group_vars/redis.yml
echo "image: ${image}" >> ${path}/group_vars/redis.yml

docker pull ${image}
docker save ${image} > ${path}/file/redis.tar
bzip2 -z --best ${path}/file/redis.tar