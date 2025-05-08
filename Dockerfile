# Basis-Image mit Python 3.12
FROM python:3.12

# Aktualisierung der Paketliste und Installation von Nano, Bash, SSH
RUN apt-get update && apt-get install -y nano bash openssh-server
RUN apk add --no-cache openssh

# Installation von PyCharm Community Edition
RUN apt-get install -y wget \
    && wget https://download.jetbrains.com/python/pycharm-community-2023.1.tar.gz \
    && tar -xzf pycharm-community-2023.1.tar.gz -C /opt/ \
    && rm pycharm-community-2023.1.tar.gz

# Standard-Arbeitsverzeichnis setzen
WORKDIR /workspace

# Installation der benötigten Python-Pakete und Django Framework
RUN pip install requests django

# SSH-Konfiguration
RUN mkdir /var/run/sshd


RUN echo "password" | passwd --stdin root

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_configersion: '3.8'

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

EXPOSE 22

# Standard-Kommando setzen
CMD ["/bin/bash"]
