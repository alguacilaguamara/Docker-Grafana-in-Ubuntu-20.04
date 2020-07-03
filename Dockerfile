FROM ubuntu:20.04

ARG GRAFANA_KEY="https://packages.grafana.com/gpg.key"
ARG GRAFANA_REPO="https://packages.grafana.com/oss/deb"

# Essential  packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gnupg gnupg2 gnupg1 adduser libfontconfig1 wget

RUN mkdir -p /grafana

WORKDIR /grafana

# This port is used by Grafana
EXPOSE 3000

# Grafana installation
RUN wget https://dl.grafana.com/oss/release/grafana_7.0.5_amd64.deb
RUN dpkg -i grafana_7.0.5_amd64.deb

# Grafana bootup
RUN update-rc.d grafana-server defaults 95 10

# Grafana startup
ENTRYPOINT grafana-server --homepath="/usr/share/grafana"
CMD ["--config="/etc/grafana/grafana.ini""]
