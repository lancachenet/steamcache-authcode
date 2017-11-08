FROM php:apache
MAINTAINER Jessica Smith <jess@mintopia.net>

ENV \
    STEAM_FETCH_TIME=1 \
    STEAM_IP_WHITELIST=
COPY src/ /var/www/html/
RUN \
    mkdir /var/secrets
VOLUME /var/secrets