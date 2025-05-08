# Verwende das offizielle Alpine-Image als Basis
FROM alpine:latest

# Aktualisiere die Paketliste und installiere notwendige Pakete
RUN apk --no-cache add bash curl python3 py3-pip openssh shadow vim nano wget

WORKDIR /workspace
RUN python3 -m venv /path/to/venv
RUN . /path/to/venv/bin/activate

# Setze das Root-Passwort (nicht empfohlen, besser über ein sicheres Geheimnis-Management)
RUN echo "root:m2X!giqum" | chpasswd

# Installiere die Python-Bibliotheken requests und Django
RUN pip3 install requests django

# Aktiviere und starte den SSH-Dienst
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Exponiere den SSH-Port
EXPOSE 22

# Starte den SSH-Dienst
CMD ["/usr/sbin/sshd", "-D"]