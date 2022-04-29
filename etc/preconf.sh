#!/bin/bash

# @since 2019-0327-13:10:21.902729760edt
# @author Liang Chen
# @organization UPMC

set +e

#-sys-config;
sed -i "s/UID_MAX/UID_MAX 2000220000\\n#UID_MAX/g" /etc/login.defs
sed -i "s/GID_MAX/GID_MAX 2000220000\\n#GID_MAX/g" /etc/login.defs

#-add-user;
tmplst="/tmp/.userlist.txt"
rm -f $tmplst && touch $tmplst

echo "mroute:test2469:$IMG_UID:$IMG_UID:msg,route:$MR_HOME:/bin/bash" >> $tmplst
newusers $tmplst
rm $tmplst

wc -l /etc/subuid /etc/subgid

#-add-pkg;
DEBIAN_FRONTEND=noninteractive apt-get -y install erlang-nox logrotate rabbitmq-server
DEBIAN_FRONTEND=noninteractive apt-get clean

#-update-permission;
mkdir -p $MR_HOME/temp

chown -R $IMG_UID:$IMG_UID $MR_HOME

chmod 775 $MR_HOME $MR_HOME/etc $MR_HOME/temp
chmod a+x $MR_HOME/etc/*sh

#--final-clean-up--#
_sp=$(realpath $0)
rm -f $_sp

exit 0

#--eof--#
