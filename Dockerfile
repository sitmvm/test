FROM debian:buster
MAINTAINER Liang Chen "liangchenomc@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y apt-utils

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-transport-https gnupg debian-archive-keyring \
    procps psmisc htop mg \
    dnsutils net-tools curl wget \
    stunnel4 \
    supervisor

ENV MR_HOME=/opt/mr

RUN mkdir -p $MR_HOME
ADD ./etc $MR_HOME/etc

ARG IMG_UID=1000
# some configurations
RUN bash $MR_HOME/etc/preconf.sh

USER $IMG_UID

WORKDIR $MR_HOME

CMD $MR_HOME/etc/run.sh
