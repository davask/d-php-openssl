FROM davask/d-apache-openssl:2.4-u14.04
MAINTAINER davask <docker@davaskweblimited.com>
USER root
LABEL dwl.app.language="php5.6"

ENV DWL_PHP_VERSION 5.6
ENV DWL_PHP_DATETIMEZONE Europe/Paris

# Update packages
RUN apt-get update && apt-get install -y \
php5 \
php5-fpm \
php5-mcrypt \
php5-mysqlnd \
php5-gd \
php5-curl \
php5-memcached \
php5-cli \
php5-readline \
php5-mysqlnd \
php5-json \
php5-intl \
libapache2-mod-php5 \
memcached \
sendmail-bin \
sendmail

RUN apt-get upgrade -y && \
apt-get autoremove -y && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN chmod +x /dwl/init.sh && chown root:sudo -R /dwl
USER admin
