FROM alpine:3.22

RUN apk add --no-cache tor bash

# Copy config and entrypoint
COPY conf/torrc /etc/tor/torrc
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

# Make entrypoint executable
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]