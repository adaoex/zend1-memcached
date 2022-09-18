FROM php:7.0-apache

MAINTAINER adaoex

LABEL Description="ZF1 Lab Application"

ENV ACCEPT_EULA=Y

WORKDIR /var/www/html

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

RUN apt-get update  \
    && apt-get install -y libpq-dev mcrypt zip unzip memcached \
    && docker-php-ext-install pdo pdo_pgsql

RUN apt-get install -y libicu-dev zlib1g-dev libmemcached-dev \
    && pecl install memcached-3.2.0 \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && a2enmod rewrite \
    && echo "AllowEncodedSlashes On" >> /etc/apache2/apache2.conf \
    && cp /usr/local/etc/php/php.ini-production  /usr/local/etc/php/php.ini \
    && echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini

COPY . /var/www/html
COPY ./vhost.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80 11211
