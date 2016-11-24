FROM debian:8

ARG MAILCOW_VERSION=0.14

ENV UID=991 GID=991 \
    TZ=Etc/UTC \
    HOSTNAME=mail \
    DOMAIN=local

RUN apt-get update && apt-get install wget -y && \
    mkdir /build && \
    wget -O - https://github.com/andryyy/mailcow/archive/v${MAILCOW_VERSION}.tar.gz | tar xfz - --strip-components 1 -C /build

COPY mailcow.config /build/mailcow.config
COPY run.sh /usr/local/bin/run.sh

RUN chmod +x /usr/local/bin/* /build/*.sh

CMD run.sh