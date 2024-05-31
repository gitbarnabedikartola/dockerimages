# Use a imagem base Alpine
FROM alpine:latest

# Instalar dependências necessárias
RUN apk add --no-cache restic curl ca-certificates openssh-client tzdata jq mariadb-client

# Baixar e instalar a versão mais recente do resticprofile
RUN if [ "$(uname -i)" = "x86_64" ]; then ARCH=amd64; elif [ "$(uname -i)" = "aarch64" ];then ARCH=arm64; fi \
    && curl -s https://api.github.com/repos/creativeprojects/resticprofile/releases/latest | jq -r '.assets[] | select(.name | contains("linux_'$ARCH'")) | .browser_download_url' | grep -v  no_self_update | xargs curl -L -o resticprofile.tar.gz \
    && tar xzf resticprofile.tar.gz -C /sbin resticprofile \
    && rm resticprofile.tar.gz

# Comando padrão para executar o backup
CMD ["/sbin/resticprofile", "backup"]
