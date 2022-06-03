FROM php:8.1-fpm

MAINTAINER Will Wright <will@magesmith.com>

RUN export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8 && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated php8.1-fpm php8.1-cli php8.1 php8.1-curl php8.1-common php8.1-gd \
    php8.1-dev php8.1-opcache php8.1-mysql php8.1-readline php8.1-xsl php8.1-xmlrpc \
    php8.1-intl php8.1-zip php8.1-soap php8.1-cli php8.1-xml php8.1-mbstring php8.1-bcmath php-redis \
    php8.1-bz2 php8.1-imagick php8.1-xdebug telnet  \
    && phpenmod mcrypt xsl imagick

#
#   Xdebug setup
#
COPY configs/etc/php/8.1/mods-available/xdebug.ini etc/php/8.1/mods-available/xdebug.ini
RUN touch /var/log/xdebug.log && chmod a+rwx /var/log/xdebug.log
RUN phpenmod xdebug

COPY configs/etc/php/8.1/fpm/php.ini /etc/php/8.1/fpm/php.ini