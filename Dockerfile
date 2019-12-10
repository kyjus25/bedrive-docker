FROM kyjus25/xampp-5.6-jessie
MAINTAINER Justin White<kyjus25@gmail.com>

COPY ./setup/php.ini /opt/lampp/etc/php.ini

EXPOSE 80 443 3306
