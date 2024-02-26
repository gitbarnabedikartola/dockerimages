# Usar a imagem base do Ubuntu
FROM ubuntu:22.04

# Evitar interações manuais durante a instalação de pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Instalar pacotes necessários
RUN apt-get update \
    && apt -y upgrade \
    && apt -y install software-properties-common \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get install -y \
    mysql-client \
    nano \
    vim \
    composer \
    bash-completion \
    tar \
    zip \
    git \
    supervisor \
    wget \
    curl \
    telnet \
    openssh-server \
    htop \
    strace \
    npm \
    locales \
    iputils-ping \
    telnet \
    findutils \
    php8.1 \
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
 && locale-gen pt_BR.UTF-8 \
 && ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && rm -rf /var/lib/apt/lists/* \
 && wget -qO /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod +x /usr/local/bin/wp

# Preparar o diretório para SSH e configurar o acesso sem senha para o usuário root
RUN mkdir /var/run/sshd \
 && echo 'PermitRootLogin no' >> /etc/ssh/sshd_config \
 && echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config \
 && echo 'ChallengeResponseAuthentication no' >> /etc/ssh/sshd_config \
 && sed -i 's/UsePAM.*/UsePAM yes/'  /etc/ssh/sshd_config

ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR:pt
ENV LC_ALL pt_BR.UTF-8

# Definir o diretório de trabalho
WORKDIR /var/www/vhosts/

# Expor a porta do SSH
EXPOSE 22

# Definir o script de inicialização como ponto de entrada
ENTRYPOINT ["/usr/local/bin/start-microvm.sh"]

