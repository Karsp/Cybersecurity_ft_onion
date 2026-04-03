#!/bin/bash
set -e

# If you have environment variables in your nginx.conf, 
# this line replaces them. Otherwise, it just copies the file.
# envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

echo "Nginx setup complete. Starting server..."

# Start Nginx in the foreground
# 'daemon off;' is vital to keep the Docker container running.
exec nginx -g "daemon off;"