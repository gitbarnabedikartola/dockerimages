# Usar a imagem base do Ubuntu
FROM rockylinux:9

# Instalar pacotes necessários
RUN dnf upgrade -y --refresh \
  && dnf -y install epel-release \
  && dnf -y update \
  && dnf -y install --allowerasing \
    mysql \
    openssh-server \
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
    htop \
    php \
    rsync \
    strace \
    npm \
    iputils \
    findutils \
    php-common \
    php-mysqlnd \
    php-gd \
    php-xml \
    php-mbstring \
    php-mcrypt \
    php-zip \
    php-fpm \
    php-cli \
    php-redis \
    php-opcache \
    php-pgsql \
    php-ldap \
    php-bcmath \
    php-mysqlnd \
  && dnf clean all \
  && wget -qO /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp \
  && wget https://github.com/starship/starship/releases/latest/download/starship-$(uname -i)-unknown-linux-musl.tar.gz -O starship.tar.gz \
  && tar -xf starship.tar.gz -C /usr/bin \
  && rm -rf starship.tar.gz \
  && chmod +x /usr/bin/starship 

#     
#     php-mysql \
#     locales \
#     php-intl \
#     php8.1-apcu \
#     php8.1-imap \
#     php8.1-cgi \
#     php8.1-curl \
#     php8.1-bz2 \
#     php8.1-xmlrpc \
#     php8.1-dom \
#     php8.1-fileinfo \
#     php8.1-simplexml \
#     php8.1-xmlreader \
#     php8.1-xmlwriter \
#     php8.1-bz2 \
#     php8.1-phar \
#     php8.1-exif \
#     php8.1-opcache \
#     php8.1-imagick \
#  && locale-gen pt_BR.UTF-8 \
#  && ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
#  && dpkg-reconfigure --frontend noninteractive tzdata \
#  && rm -rf /var/lib/apt/lists/* \


# Preparar o diretório para SSH e configurar o acesso sem senha para o usuário root
RUN mkdir /var/run/sshd \
  && echo 'PermitRootLogin no' >> /etc/ssh/sshd_config \
  && echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config \
  && echo 'ChallengeResponseAuthentication no' >> /etc/ssh/sshd_config \
  && sed -i 's/UsePAM.*/UsePAM yes/' /etc/ssh/sshd_config


ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR:pt
ENV LC_ALL pt_BR.UTF-8

# Definir o diretório de trabalho
WORKDIR /var/www/vhosts/

# Expor a porta do SSH
EXPOSE 22

# Definir o script de inicialização como ponto de entrada
ENTRYPOINT ["/usr/local/bin/start-microvm.sh"]

