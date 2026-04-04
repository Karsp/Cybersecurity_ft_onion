FROM alpine:3.22

# Install all services + shadow (for useradd) + gettext (for envsubst)
RUN apk update && apk add --no-cache \
    nginx \
    openssl \
    gettext \
    bash \
    openssh \
    tor \
    curl \
    shadow

# Generate the host keys (RSA, ECDSA, ED25519)
RUN ssh-keygen -A

# Setup Nginx
RUN mkdir -p /var/www/html /run/nginx && \
    chown -R nginx:nginx /var/www/html

# Setup SSH
RUN mkdir -p /var/run/sshd

# Setup Tor permissions
RUN mkdir -p /var/lib/tor/hidden_service && \
    chown -R tor:tor /var/lib/tor

# Copy all configurations
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/index.html /var/www/html/index.html
COPY conf/sshd_config /etc/ssh/sshd_config
COPY conf/torrc /etc/tor/torrc

# Copy and prepare the single entrypoint
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Subject requires Port 80 for Web and 4242 for SSH
EXPOSE 80 4242

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]