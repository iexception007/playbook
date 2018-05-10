#!/usr/bin/env bash
docker exec rabbitmq rabbitmqctl set_policy ha-allqueue "^" '{"ha-mode":"all"}'