FROM debian:12-slim

LABEL org.opencontainers.image.description="Basic systemd-enabled debian image"
LABEL org.opencontainers.image.licenses=MIT

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y systemd python3 \
    && apt-get clean \
    && truncate -s0 /etc/machine-id \
    && truncate -s0 /var/lib/dbus/machine-id

CMD ["/lib/systemd/systemd"]
