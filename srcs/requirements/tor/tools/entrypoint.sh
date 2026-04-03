#!/bin/sh
set -e

# 1. Ensure the directory exists
mkdir -p /var/lib/tor/hidden_service

# 2. Fix permissions (The "0700" Fix)
# Tor will NOT start if permissions are anything other than 700
chmod 700 /var/lib/tor/hidden_service

# 3. Ensure the 'tor' user owns the files
chown -R tor:tor /var/lib/tor

echo "Tor permissions fixed. Starting Tor..."

# 4. Start Tor as the 'tor' user
# We use 'exec' so Tor becomes PID 1
exec su -s /bin/sh -c "tor -f /etc/tor/torrc" tor