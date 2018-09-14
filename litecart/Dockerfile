FROM php:7.0-apache

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends wget unzip zlib1g-dev

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install zip
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo_mysql

RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y git

WORKDIR /var/www
RUN git clone 'https://github.com/litecart/litecart.git'
RUN chmod -R 777 /var/www/litecart

ENV APACHE_DOCUMENT_ROOT /var/www/litecart/public_html
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN apt-get install -y --no-install-recommends locales
RUN sed -i 's/# en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen && locale-gen && update-locale LANG=en_US.UTF-8

EXPOSE 80
