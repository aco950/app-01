# vim:set ft=dockerfile
FROM centos:6.10 

LABEL maintainer="Allan Ogilvie <aco950 at gmail dot com>"

RUN yum -y install \
  httpd \
  php-common \
  php-cli \
  php-devel \
  php-fpm \
  php-gd \
  php-imap \
  php-imap \
  php-intl \
  php-mysql \
  php-process \
  php-xml \
  php-xmlrpc \
  php-zts 

ADD httpd.conf /etc/httpd.conf
ADD index.php /var/www/html

EXPOSE 80

CMD httpd -D FOREGROUND 

