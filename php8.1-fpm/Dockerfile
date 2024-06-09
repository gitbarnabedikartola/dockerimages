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
# RUN apt -y install php8.1-fpm
RUN apt -y install php8.1 \
php8.1-apcu \
php8.1-imap \
php8.1-cgi \
php8.1-opcache \
php8.1-pgsql \
php8.1-curl \
php8.1-bz2 \
php8.1-ldap \
php8.1-bcmath \
php8.1-common \
php8.1-mysql \
php8.1-mysqlnd \
php8.1-gd \
php8.1-xml \
php8.1-xmlrpc \
php8.1-mbstring \
php8.1-mcrypt \
php8.1-zip \
php8.1-intl \
php8.1-fpm \
php8.1-cli \
php8.1-redis \
php8.1-dom \
php8.1-fileinfo \
php8.1-simplexml \
php8.1-xmlreader \
php8.1-xmlwriter \
php8.1-bz2 \
php8.1-phar \
php8.1-exif \
php8.1-opcache \
php8.1-imagick \
libjpeg-turbo-progs \
locales
RUN apt clean all

RUN groupadd -g 48 apache
RUN useradd -u 48 -g apache -m -r -d /usr/share/httpd -s /sbin/nologin apache

RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/8.1/fpm/php.ini
RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/8.1/cli/php.ini
RUN sed -i 's|include=/etc/php/8.1/fpm/pool.d/|include=/etc/php-fpm.d/|' /etc/php/8.1/fpm/php-fpm.conf

# Create service folders
RUN mkdir -p /run/php
RUN mkdir -p /etc/php-fpm.d
RUN mkdir -p /run/php-fpm
RUN mkdir -p /etc/pki/acme
RUN UMASK=027 mkdir -p /var/www/vhosts
RUN chown apache:apache /var/www/vhosts

RUN locale-gen pt_BR.UTF-8; update-locale LANG=pt_BR.UTF-8

# Run the httpd
ENTRYPOINT ["/usr/local/bin/start-php8.1-fpm.sh"]
