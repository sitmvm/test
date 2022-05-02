#!/bin/bash

# @author Liang Chen
# @since 2019-04-19 10:03:22.828827400 -0400
# @organization UPMC

set +e

if [ "$HOME" != "$MR_HOME" ]; then
    HOME=$MR_HOME
fi
export HOME

RABBITMQ_CONFIG_FILE="${HOME}/etc/rabbitmq"
export RABBITMQ_CONFIG_FILE
RABBITMQ_ENABLED_PLUGINS_FILE="${HOME}/etc/enabled_plugins"
export RABBITMQ_ENABLED_PLUGINS_FILE

RABBITMQ_LOG_BASE="${HOME}/temp/log"
export RABBITMQ_LOG_BASE
RABBITMQ_MNESIA_BASE="${HOME}/temp/mnesia"
export RABBITMQ_MNESIA_BASE

mkdir -p $RABBITMQ_LOG_BASE $RABBITMQ_MNESIA_BASE

# bring up the service;
echo "start daemon"
supervisord -c ${HOME}/etc/supervisord.conf

# failsafe;
echo "[ii] failsafe"
while true; do
    sleep 30;
done

#---eof---#
