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
RUN apt -y install software-properties-common curl iputils-ping
RUN add-apt-repository -y ppa:ondrej/php
RUN apt -y install php7.4-fpm
RUN apt -y install apache2-utils php-pear php7.4-bcmath php7.4-cli php7.4-gmp php7.4-curl php7.4-gd php7.4-intl php7.4-json php7.4-ldap php7.4-mbstring php7.4-pgsql php7.4-soap php7.4-xml php7.4-xmlrpc php7.4-apcu php7.4-zip php7.4-opcache php7.4-mysql php7.4-memcache php7.4-redis php7.4-imagick locales
RUN apt clean all

RUN groupadd -g 48 apache
RUN useradd -u 48 -g apache -m -r -d /usr/share/httpd -s /sbin/nologin apache

RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/7.4/fpm/php.ini
RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/7.4/cli/php.ini
RUN sed -i 's|include=/etc/php/7.4/fpm/pool.d/|include=/etc/php-fpm.d/|' /etc/php/7.4/fpm/php-fpm.conf

# Create service folders
RUN mkdir -p /run/php
RUN mkdir -p /etc/php-fpm.d
RUN mkdir -p /run/php-fpm
RUN mkdir -p /etc/pki/acme
RUN UMASK=027 mkdir -p /var/www/vhosts
RUN chown apache:apache /var/www/vhosts

RUN locale-gen pt_BR.UTF-8; update-locale LANG=pt_BR.UTF-8

# Run the httpd
ENTRYPOINT ["/usr/local/bin/start-php7.4-fpm.sh"]
