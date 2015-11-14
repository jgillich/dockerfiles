FROM alpine:3.2

# TODO replace nodejs with v8 when it gets out of testing
RUN apk add --update ruby ruby-bundler ruby-dev ruby-nokogiri build-base libffi libffi-dev zlib-dev tzdata nodejs && \
    rm -rf /var/cache/apk/* && \
    gem install middleman

WORKDIR /site
ENV MM_ROOT /site
VOLUME /site

COPY run.sh /run.sh

EXPOSE 4567

ENTRYPOINT /run.sh
