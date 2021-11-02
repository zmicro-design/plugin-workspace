FROM  whatwewant/zmicro:v1.5.15

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

COPY  build/config/default_locale /etc/default/locale

COPY  build/config/locale /var/lib/locales/supported.d/local

RUN   apt install -yqq locales

RUN   locale-gen en_US.UTF-8

ARG   WORKSPACE_USER=workspace

ENV   WORKSPACE_USER=$WORKSPACE_USER USER=$WORKSPACE_USER HOME=/home/$WORKSPACE_USER TZ=Asia/Shanghai

COPY  build/config/sshd_config /etc/ssh/sshd_config

COPY  build/bin/create_user /build/bin/create_user

RUN   sh /build/bin/create_user $WORKSPACE_USER

USER  $WORKSPACE_USER

WORKDIR /home/workspace/code

RUN   zmicro update -a

RUN   zmicro plugin install workspace

RUN   zmicro plugin run workspace initialize nodejs

ARG   VERSION=latest

ENV   WORKSPACE_VERSION=${VERSION}

# COPY  build/config/hosts /etc/hosts

# RUN   sudo apt update

RUN   echo "WORKSPACE_VERSION: ${VERSION}"

RUN   zmicro update -a && zmicro plugin update workspace && zmicro plugin run workspace upgrade

COPY  build /build

CMD   sh /build/bin/start
