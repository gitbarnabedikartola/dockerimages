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
RUN apt -y install php7.0-fpm
RUN apt -y install apache2-utils php-pear php7.0-bcmath php7.0-cli php7.0-gmp php7.0-curl php7.0-gd php7.0-intl php7.0-json php7.0-ldap php7.0-mbstring php7.0-pgsql php7.0-soap php7.0-xml php7.0-xmlrpc php7.0-apcu php7.0-zip php7.0-opcache php7.0-mysql php7.0-memcache php7.0-redis php7.0-imagick locales
RUN apt clean all

RUN groupadd -g 48 apache
RUN useradd -u 48 -g apache -m -r -d /usr/share/httpd -s /sbin/nologin apache

RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/7.0/fpm/php.ini
RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/7.0/cli/php.ini
RUN sed -i 's|include=/etc/php/7.0/fpm/pool.d/|include=/etc/php-fpm.d/|' /etc/php/7.0/fpm/php-fpm.conf

# Create service folders
RUN mkdir -p /run/php
RUN mkdir -p /etc/php-fpm.d
RUN mkdir -p /run/php-fpm
RUN mkdir -p /etc/pki/acme
RUN UMASK=027 mkdir -p /var/www/vhosts
RUN chown apache:apache /var/www/vhosts

RUN locale-gen pt_BR.UTF-8; update-locale LANG=pt_BR.UTF-8

# Run the httpd
ENTRYPOINT ["/usr/local/bin/start-php7.0-fpm.sh"]
