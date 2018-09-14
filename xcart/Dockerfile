FROM php:7.0-apache

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends wget unzip

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

WORKDIR /var/www
RUN wget http://img.x-cart.com/software/a/x-cart-5.3.5.4-en.tgz
RUN tar xf x-cart-5.3.5.4-en.tgz
RUN chmod -R 777 /var/www/xcart

ENV APACHE_DOCUMENT_ROOT /var/www/xcart
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

EXPOSE 80
