FROM php:7.4-fpm

RUN apt-get update -y && \
apt-get install -y \
libzip-dev \
libmcrypt-dev \
libpq-dev \
libcurl4-gnutls-dev \
libicu-dev \
libvpx-dev \
libjpeg-dev \
libpng-dev \
libxpm-dev \
zlib1g-dev \
libfreetype6-dev \
libxml2-dev \
libexpat1-dev \
libbz2-dev \
libgmp3-dev \
libldap2-dev \
unixodbc-dev \
libsqlite3-dev \
libaspell-dev \
libsnmp-dev \
libpcre3-dev \
libtidy-dev \
git \
openssh-client \
nano \
nodejs \
npm

RUN npm install yarn -g

RUN yarn install
RUN yarn add @symfony/webpack-encore --dev

RUN docker-php-ext-install zip

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

RUN mkdir -p /root/.ssh

RUN cd app
RUN yarn install \
yarn build
