FROM php:7.0-apache

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends wget unzip zlib1g-dev

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install zip

RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

WORKDIR /var
COPY oscommerce-2.3.4.1.zip /var/
#RUN wget 'https://www.oscommerce.de/Products&Download=oscom2341' -O oscommerce.zip
RUN unzip /var/oscommerce-2.3.4.1.zip -d /var/www
RUN cp -r /var/www/oscommerce-*/catalog/* /var/www/html
RUN chmod 777 /var/www/html/includes/configure.php
RUN chmod 777 /var/www/html/admin/includes/configure.php

ENV APACHE_DOCUMENT_ROOT /var/www/html
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

EXPOSE 80
