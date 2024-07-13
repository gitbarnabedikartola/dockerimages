# Base on Ubuntu 22 LTS
FROM docker.io/library/ubuntu:22.04
MAINTAINER nazuka email jose@maran.net.br

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR:pt
ENV LC_ALL pt_BR.UTF-8
ENV TZ="America/Sao_Paulo"

# Install updates and httpd
RUN apt clean all
RUN apt -y update
RUN apt -y upgrade
RUN apt -y install software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
# RUN apt -y install php8.0-fpm
RUN apt -y install php8.0 \
php8.0-apcu \
php8.0-imap \
php8.0-cgi \
php8.0-opcache \
php8.0-pgsql \
php8.0-curl \
php8.0-bz2 \
php8.0-ldap \
php8.0-bcmath \
php8.0-common \
php8.0-mysql \
php8.0-mysqlnd \
php8.0-gd \
php8.0-xml \
php8.0-xmlrpc \
php8.0-mbstring \
php8.0-mcrypt \
php8.0-zip \
php8.0-intl \
php8.0-fpm \
php8.0-cli \
php8.0-redis \
php8.0-dom \
php8.0-fileinfo \
php8.0-simplexml \
php8.0-xmlreader \
php8.0-xmlwriter \
php8.0-bz2 \
php8.0-phar \
php8.0-exif \
php8.0-opcache \
php8.0-imagick \
libjpeg-turbo-progs \
locales
RUN apt clean all

RUN groupadd -g 48 apache
RUN useradd -u 48 -g apache -m -r -d /usr/share/httpd -s /sbin/nologin apache

RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/8.0/fpm/php.ini
RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/8.0/cli/php.ini
RUN sed -i 's|include=/etc/php/8.0/fpm/pool.d/|include=/etc/php-fpm.d/|' /etc/php/8.0/fpm/php-fpm.conf

# Create service folders
RUN mkdir -p /run/php
RUN mkdir -p /etc/php-fpm.d
RUN mkdir -p /run/php-fpm
RUN mkdir -p /etc/pki/acme
RUN UMASK=027 mkdir -p /var/www/vhosts
RUN chown apache:apache /var/www/vhosts

RUN locale-gen pt_BR.UTF-8; update-locale LANG=pt_BR.UTF-8

# Run the httpd
ENTRYPOINT ["/usr/local/bin/start-php8.0-fpm.sh"]
