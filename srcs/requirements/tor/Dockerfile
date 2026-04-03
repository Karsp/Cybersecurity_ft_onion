FROM alpine:latest

RUN apk add --no-cache tor

COPY conf/torrc /etc/tor/torrc

# Ensure correct permissions for Tor
RUN mkdir -p /var/lib/tor/hidden_service && \
    chown -R tor:tor /var/lib/tor

USER tor

CMD ["tor", "-f", "/etc/tor/torrc"]