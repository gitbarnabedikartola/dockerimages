# Usar uma imagem base oficial do Python
FROM python:3.8-slim

# Definir o diretório de trabalho
WORKDIR /app

# Instalar dependências
RUN apt update \
  && apt install -y \
    ansible \
    python3-hcloud \
    openssh-server \
    vim \
    nano \
    curl \
  && mkdir -p -m0755 /var/run/sshd

COPY python-flask/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o código da aplicação para o container
# COPY python-flask/app/* /app

# Expor a porta do Flask
EXPOSE 5000

# Comando para rodar a aplicação
# CMD ["python", "app.py"]
CMD ["tail", "-f", "/dev/null"]
