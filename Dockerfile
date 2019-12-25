FROM debian:jessie
MAINTAINER Justin White<kyjus25@gmail.com>

RUN apt-get update; apt-get install wget net-tools -y

RUN wget -O 'xampp.run' https://svwh.dl.sourceforge.net/project/xampp/XAMPP%20Linux/5.6.39/xampp-linux-x64-5.6.39-0-installer.run

RUN chmod +x ./xampp.run

RUN ./xampp.run --mode unattended --unattendedmodeui  minimal

RUN rm ./xampp.run

# Enable XAMPP web interface(remove security checks)
RUN /opt/lampp/bin/perl -pi -e s'/Require local/Require all granted/g' /opt/lampp/etc/extra/httpd-xampp.conf

COPY ./setup/php.ini /opt/lampp/etc/php.ini

EXPOSE 80 443 3306
