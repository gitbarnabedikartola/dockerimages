# Usar a imagem base do Ubuntu
FROM rockylinux:9

RUN dnf upgrade -y --refresh \
  && dnf -y install epel-release \
  && dnf -y install https://rpms.remirepo.net/enterprise/remi-release-9.rpm \
  && dnf -y module install php:remi-8.1 \
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
    php-mysql \
    php-intl \
    php-apcu \
    php-curl \
    php-bz2 \
    php-xmlrpc \
    php-opcache \
  && dnf clean all \
  && wget -qO /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp \
  && wget https://github.com/starship/starship/releases/latest/download/starship-$(uname -i)-unknown-linux-musl.tar.gz -O starship.tar.gz \
  && tar -xf starship.tar.gz -C /usr/bin \
  && rm -rf starship.tar.gz \
  && chmod +x /usr/bin/starship

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

