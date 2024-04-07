# Usar uma imagem base oficial do Python
FROM python:3.8-slim

# Definir o diretório de trabalho
WORKDIR /app

# Instalar dependências
RUN apt update \
  apt install -y \
    python3-flask

# Copiar o código da aplicação para o container
# COPY . /app

# Expor a porta do Flask
EXPOSE 5000

# Comando para rodar a aplicação
# CMD ["python", "app.py"]
CMD ["tail", "-f", "/dev/null"]
