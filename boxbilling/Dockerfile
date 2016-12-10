FROM alpine:edge
MAINTAINER Jakob Gillich <jakob@gillich.me>

ARG BOXBILLING_VERSION=4.20

ENV UID=991 GID=991 \
    TZ=Etc/UTC \
    BOXBILLING_URL=http://localhost:8888

RUN apk add --no-cache \
    nginx \
    gettext \
    su-exec \
    tzdata \
    s6 \
    ca-certificates \
    mariadb \
    mariadb-client \
    pwgen \
    php7 \
    php7-fpm \
    php7-mbstring \
    #php7-gd \
    #php7-mcrypt \
    php7-opcache \
    #php7-json \
    php7-pdo \
    php7-pdo_mysql \
    #php7-mysqli \
    php7-zlib \
    #php7-xmlrpc \
    #php7-openssl \
 && mkdir /boxbilling \
 && BOXBILLING_ZIP=BoxBilling.zip \
 && wget -q https://github.com/BOXBILLING/BOXBILLING/releases/download/${BOXBILLING_VERSION}/${BOXBILLING_ZIP} \
 && unzip $BOXBILLING_ZIP -d /boxbilling && rm $BOXBILLING_ZIP

COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY my.cnf /etc/mysql/my.cnf
COPY run.sh /usr/local/bin/run.sh
COPY setup.sh /usr/local/bin/setup.sh
COPY s6.d /etc/s6.d

RUN chmod +x /usr/local/bin/* /etc/s6.d/*/* /etc/s6.d/.s6-svscan/*

VOLUME /data

EXPOSE 8888

LABEL description="Open source billing and client management software" \
      boxbilling="BoxBilling v${BOXBILLING_VERSION}"

CMD ["run.sh"]