FROM php:7.0-apache

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends wget unzip

RUN docker-php-ext-install mysqli

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

WORKDIR /var
RUN wget https://github.com/arastta/arastta/releases/download/1.6.2/Arastta_1.6.2-Stable.zip -O arastta.zip
RUN unzip arastta.zip -d /var/www/html
RUN chmod -R 777 /var/www/html

ENV APACHE_DOCUMENT_ROOT /var/www/html
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN apt-get update && apt-get install -y libmcrypt-dev
RUN docker-php-ext-install mcrypt

EXPOSE 80
