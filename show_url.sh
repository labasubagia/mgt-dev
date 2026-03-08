#!/bin/sh
echo "Dashboard url: https://127.0.0.1:8443"
echo "Add '127.0.0.1 dev.mgt' to /etc/hosts"

# Use grep to check for "microsoft" in a portable way
if uname -a | grep -iq "microsoft"; then
    echo "\nIf you are using WSL and above does not work, try the following:"
    # In WSL, get the eth0 IP
    WSL_IP=$(ip addr show eth0 | grep "inet " | awk '{print $2}' | cut -d/ -f1)
    echo "Dashboard url: https://$WSL_IP:8443"
    printf "Add '%s dev.mgt' to %s\n" $WSL_IP 'C:\Windows\System32\drivers\etc\hosts'
fi
