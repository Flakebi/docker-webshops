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
RUN wget https://github.com/cubecart/v6/archive/6.2.0-branch.zip
RUN unzip 6.2.0-branch.zip -d /var/www
RUN chmod -R 777 /var/www/v6-6.2.0-branch

ENV APACHE_DOCUMENT_ROOT /var/www/v6-6.2.0-branch
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

EXPOSE 80
#CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
