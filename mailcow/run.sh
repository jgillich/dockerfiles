#!/bin/bash

sed -i -e "s~<HOSTNAME>~$HOSTNAME~g" /build/mailcow.config \
       -e "s~<DOMAIN>~$DOMAIN~g" /build/mailcow.config \
       -e "s~<TZ>~$TZ~g" /build/mailcow.config

cd build && /build/install.sh