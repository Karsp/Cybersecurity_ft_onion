#!/bin/bash

# Read secrets
USER_NAME=$(cat /run/secrets/ssh_user)
USER_PASS=$(cat /run/secrets/ssh_password)

# Create user and set password
useradd -m -s /bin/bash "$USER_NAME"
echo "$USER_NAME:$USER_PASS" | chpasswd

echo "SSH User $USER_NAME created successfully."

# Start SSH in foreground
/usr/sbin/sshd -D