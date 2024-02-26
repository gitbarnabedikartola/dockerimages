# Use a imagem oficial do Alpine para aarch64
FROM alpine:latest

# Instala o NGINX e o módulo de cache purge
RUN apk add --no-cache nginx nginx-mod-http-cache-purge

# Copia a configuração personalizada para o NGINX (se necessário)
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY default.conf /etc/nginx/conf.d/default.conf

RUN sed -i '/client_max_body_size/s/client_max_body_size/#client_max_body_size/' /etc/nginx/nginx.conf

# Exponha a porta 80 e 443 para o tráfego HTTP e HTTPS
EXPOSE 80

# Comando para iniciar o NGINX
CMD ["nginx", "-g", "daemon off;"]
