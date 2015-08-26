FROM php:5.6-cli
MAINTAINER system@kitpages.fr

# Install git
RUN apt-get update && apt-get install -y git

#Install Composer globally
RUN curl -s -o /usr/local/bin/composer https://getcomposer.org/composer.phar && \
    chmod 0755 /usr/local/bin/composer

# Install mcrypt extension
RUN apt-get install -y \
    libmcrypt-dev \
    libssl-dev &&\
    docker-php-ext-install mcrypt

# Install gd
RUN apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev &&\
    docker-php-ext-install gd

# Install internationalization
RUN apt-get install -y\
    g++ \
    libicu-dev &&\
    docker-php-ext-install intl

# Install xdebug
RUN pecl install xdebug &&\
    echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" > /usr/local/etc/php/conf.d/ext-xdebug.ini

# Install mongo
RUN pecl install mongo &&\
    echo "extension=mongo.so" > /usr/local/etc/php/conf.d/ext-mongo.ini

# Install zip extension
RUN docker-php-ext-install zip

# Install mb string exention
RUN docker-php-ext-install mbstring
