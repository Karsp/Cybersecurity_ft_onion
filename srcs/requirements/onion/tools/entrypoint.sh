#!/bin/bash
set -e

# 1. Setup SSH User from secrets
if [ -f /run/secrets/ssh_user ] && [ -f /run/secrets/ssh_password ]; then
    USER_NAME=$(cat /run/secrets/ssh_user)
    USER_PASS=$(cat /run/secrets/ssh_password)
    
    # Create user if it doesn't exist
    if ! id "$USER_NAME" &>/dev/null; then
        useradd -m -s /bin/bash "$USER_NAME"
        echo "$USER_NAME:$USER_PASS" | chpasswd
        echo "SSH User $USER_NAME created."
    fi
fi

# 2. Start SSH in the background
/usr/sbin/sshd

# 3. Start Nginx in the background
nginx

# 4. Fix Tor permissions (Must be 700)
chmod 700 /var/lib/tor/hidden_service
chown -R tor:tor /var/lib/tor

echo "Services started. Launching Tor..."

# 5. Start Tor in the FOREGROUND
# This keeps the container alive. If Tor stops, the container stops.
exec su -s /bin/sh -c "tor -f /etc/tor/torrc" tor