FROM php:8.2.0RC6-apache
RUN apt update && apt install zlib1g-dev libzip-dev libpng-dev libxml2-dev \
librabbitmq-dev libwebp-dev libjpeg-dev libfreetype-dev -y

RUN set -e; \
  docker-php-ext-configure gd \
    --with-webp \
    --with-jpeg \
    --with-freetype; \
  docker-php-ext-install \
    gd \
    mysqli \
    opcache \
    soap \
    zip \
  ; \
  pecl install \
    amqp \
    xdebug; \
  docker-php-ext-enable amqp

WORKDIR /var/www/html/

CMD service apache2 start && tail -f /var/log/apache2/error.log

