FROM debian:stable-slim

RUN apt-get update && apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    rm -rf /var/lib/apt/lists/*

COPY conf/sshd_config /etc/ssh/sshd_config
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]