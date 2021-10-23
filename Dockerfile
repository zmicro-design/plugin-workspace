FROM  whatwewant/zmicro:v1.3.8

ARG   DEBIAN_FRONTEND=noninteractive

RUN   apt update && apt install -yqq \
  rsyslog \
  htop \
  openssh-server openssh-client \
  fail2ban \
  psmisc \
  netcat \
  iputils-ping \
  dnsutils

COPY  build/config/locale /etc/default/locale

RUN   apt install -yqq locales

RUN   locale-gen en_US.UTF-8

COPY  build /build

ARG   WORKSPACE_USER=workspace

ENV   WORKSPACE_USER=$WORKSPACE_USER USER=$WORKSPACE_USER TZ=Asia/Shanghai

RUN   sh /build/bin/create_user $WORKSPACE_USER

RUN   sh /build/bin/create_ssh

USER  $WORKSPACE_USER

WORKDIR /home/workspace/code

RUN   zmicro update -a

RUN   zmicro plugin install workspace

RUN   zmicro plugin run workspace upgrade nodejs

ARG   VERSION=latest

ENV   WORKSPACE_VERSION=${VERSION}

# COPY  build/config/hosts /etc/hosts

# RUN   sudo apt update

RUN   zmicro plugin update workspace && zmicro plugin run workspace upgrade nodejs

CMD   sh /build/bin/start