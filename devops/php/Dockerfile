FROM php:7.0-fpm-alpine

# Install Magento PHP Extensions
RUN apk update && apk add --no-cache autoconf g++ make curl \
    libmcrypt-dev libltdl libxslt-dev icu-dev libpq php5-soap \
    zip libxml2-dev freetype-dev libjpeg-turbo-dev libpng-dev
RUN docker-php-ext-install mcrypt xsl intl pdo_mysql pdo soap zip
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

ARG ENV
ENV ENVIRON=${ENV}


# Setup templates
RUN rm /etc/php5/php.ini
COPY ./$ENVIRON/php.ini /usr/local/etc/php
COPY ./$ENVIRON/php-fpm-custom.conf /usr/local/etc/php-fpm.d
COPY ./magento /etc/cron.d/magento


# Setup files
RUN mkdir /scripts
COPY ./scripts/* /scripts/
RUN chmod -R +x /scripts/


COPY docker-entrypoint /usr/local/bin/
ENTRYPOINT ["docker-entrypoint"]
CMD ["php-fpm"]
