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
# RUN apt -y install php8.2-fpm
RUN apt -y install php8.2 \
php8.2-apcu \
php8.2-imap \
php8.2-cgi \
php8.2-opcache \
php8.2-pgsql \
php8.2-curl \
php8.2-bz2 \
php8.2-ldap \
php8.2-bcmath \
php8.2-common \
php8.2-mysql \
php8.2-mysqlnd \
php8.2-gd \
php8.2-xml \
php8.2-xmlrpc \
php8.2-mbstring \
php8.2-mcrypt \
php8.2-zip \
php8.2-intl \
php8.2-fpm \
php8.2-cli \
php8.2-redis \
php8.2-dom \
php8.2-fileinfo \
php8.2-simplexml \
php8.2-xmlreader \
php8.2-xmlwriter \
php8.2-bz2 \
php8.2-phar \
php8.2-exif \
php8.2-opcache \
php8.2-imagick \
locales
RUN apt clean all

RUN groupadd -g 48 apache
RUN useradd -u 48 -g apache -m -r -d /usr/share/httpd -s /sbin/nologin apache

RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/8.2/fpm/php.ini
RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/8.2/cli/php.ini
RUN sed -i 's|include=/etc/php/8.2/fpm/pool.d/|include=/etc/php-fpm.d/|' /etc/php/8.2/fpm/php-fpm.conf

# Create service folders
RUN mkdir -p /run/php
RUN mkdir -p /etc/php-fpm.d
RUN mkdir -p /run/php-fpm
RUN mkdir -p /etc/pki/acme
RUN UMASK=027 mkdir -p /var/www/vhosts
RUN chown apache:apache /var/www/vhosts

RUN locale-gen pt_BR.UTF-8; update-locale LANG=pt_BR.UTF-8

# Run the httpd
ENTRYPOINT ["/usr/local/bin/start-php8.2-fpm.sh"]
