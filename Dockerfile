FROM ubuntu:16.04
MAINTAINER Jérémy SEBAN <jeremy@seban.eu>

COPY ./start.sh /bin/start_factorio
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://www.factorio.com/get-download/0.13.19/headless/linux64 -O /tmp/factorio.tgz && \
    tar -xzf /tmp/factorio.tgz -C / && \
    rm /tmp/factorio.tgz && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /bin/start_factorio

VOLUME /factorio/saves /factorio/mods
EXPOSE 34197/udp

ENTRYPOINT ["/bin/start_factorio"]
CMD ["/factorio/bin/x64/factorio", "--start-server", "/factorio/saves/map.zip", "--server-settings", "/factorio/saves/settings.json"]
