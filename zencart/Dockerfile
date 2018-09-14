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
COPY zen-cart-v1.5.5f.zip /var/
RUN unzip /var/zen-cart-v1.5.5f.zip -d /var/www
RUN cp -r /var/www/zen-cart-*/* /var/www/html
RUN cp /var/www/html/includes/dist-configure.php /var/www/html/includes/configure.php
RUN cp /var/www/html/admin/includes/dist-configure.php /var/www/html/admin/includes/configure.php
RUN chmod -R 777 /var/www/html

ENV APACHE_DOCUMENT_ROOT /var/www/html
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

EXPOSE 80
