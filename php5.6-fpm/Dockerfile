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
RUN apt -y install php5.6-fpm
RUN apt -y install apache2-utils php-pear php5.6-bcmath php5.6-cli php5.6-gmp php5.6-curl php5.6-gd php5.6-intl php5.6-json php5.6-ldap php5.6-mbstring php5.6-pgsql php5.6-soap php5.6-xml php5.6-xmlrpc php5.6-apcu php5.6-zip php5.6-opcache php5.6-mysql php5.6-memcache php5.6-redis php5.6-imagick locales
RUN apt clean all

RUN groupadd -g 48 apache
RUN useradd -u 48 -g apache -m -r -d /usr/share/httpd -s /sbin/nologin apache

RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/5.6/fpm/php.ini
RUN sed -i '/short_open_tag/s/= .*/= On/' /etc/php/5.6/cli/php.ini
RUN sed -i 's|include=/etc/php/5.6/fpm/pool.d/|include=/etc/php-fpm.d/|' /etc/php/5.6/fpm/php-fpm.conf

# Create service folders
RUN mkdir -p /run/php
RUN mkdir -p /etc/php-fpm.d
RUN mkdir -p /run/php-fpm
RUN mkdir -p /etc/pki/acme
RUN UMASK=027 mkdir -p /var/www/vhosts
RUN chown apache:apache /var/www/vhosts

RUN locale-gen pt_BR.UTF-8; update-locale LANG=pt_BR.UTF-8

# Run the httpd
ENTRYPOINT ["/usr/local/bin/start-php5.6-fpm.sh"]
