# Basis-Image mit Python 3.12
FROM python:3.12

# Aktualisierung der Paketliste und Installation von Nano, Bash
RUN apt-get update && apt-get install -y nano bash

# Installation von PyCharm Community Edition
RUN apt-get install -y wget \
    && wget https://download.jetbrains.com/python/pycharm-community-2023.1.tar.gz \
    && tar -xzf pycharm-community-2023.1.tar.gz -C /opt/ \
    && rm pycharm-community-2023.1.tar.gz

# Standard-Arbeitsverzeichnis setzen
WORKDIR /workspace

# Installation der benötigten Python-Pakete
RUN pip install requests

# Standard-Kommando setzen
CMD ["/bin/bash"]
