FROM php:7.1-fpm-alpine

RUN apk add --no-cache --virtual .ext-deps \
        libjpeg-turbo-dev \
        libwebp-dev \
        libpng-dev \
        freetype-dev \
        libmcrypt-dev \
        nodejs \
        npm \
        git

RUN apk add --update --no-cache autoconf gcc g++ libtool nasm make automake pcre-dev libgit2-dev file util-linux

RUN docker-php-ext-configure gd 
RUN docker-php-ext-install gd

COPY php-fpm.conf  /etc/php7/php-fpm.conf

RUN ln -s /usr/bin/php7 /usr/bin/php
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

EXPOSE 9000

