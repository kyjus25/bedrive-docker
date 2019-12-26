FROM glats/alpine-lamp
MAINTAINER Justin White<kyjus25@gmail.com>

RUN apk update; apk add vim; apk add php7-fileinfo

COPY ./setup/php.ini /etc/php7/php.ini

COPY ./init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 80 443 3306

ENTRYPOINT ["/init.sh"]
