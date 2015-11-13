FROM alpine:3.2

RUN apk add --update ruby ruby-bundler ruby-dev ruby-nokogiri \
    build-base libffi libffi-dev zlib-dev nodejs
RUN rm -rf /var/cache/apk/*

RUN gem install middleman

ENV MM_ROOT /site
VOLUME /site

EXPOSE 4567

ENTRYPOINT bundle exec middleman
