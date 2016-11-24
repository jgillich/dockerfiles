FROM debian:8

ARG MAILCOW_VERSION=0.14

ENV DEBIAN_FRONTEND=noninteractive \
    UID=991 GID=991 \
    TZ=Etc/UTC \
    HOSTNAME=mail \
    DOMAIN=local \
    INVOICEPLANE_URL=http://localhost:8888

RUN apt-get update && apt-get install wget -y && \
    mkdir /build && \
    wget -O - https://github.com/andryyy/mailcow/archive/v${MAILCOW_VERSION}.tar.gz | tar xfz - --strip-components 1 -C /build

COPY mailcow.config /invoiceplane/application/config/config.php
COPY run.sh /usr/local/bin/run.sh
COPY install_pre.sh /build/install_pre.sh
COPY install.sh /build/install.sh


RUN chmod +x /usr/local/bin/* /build/*.sh && \
    cd /build && /build/install_pre.sh

CMD run.sh