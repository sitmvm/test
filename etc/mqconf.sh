#!/bin/bash

# @author Liang Chen
# @organization UPMC
set -e

echo "[ii] do online configuration for RabbitMQ"
sleep 15

curl -u guest:guest -sSf "http://localhost:15672/cli/rabbitmqadmin" > ./rabbitmqadmin
chmod +x ./rabbitmqadmin

# add exchange and queue;
./rabbitmqadmin declare exchange name=golog type=fanout
./rabbitmqadmin declare queue name=golog durable=true
./rabbitmqadmin declare binding source=golog destination=golog

#exit 0

#--eof--#
