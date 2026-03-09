# !/bin/bash
# other ports >= 22 are allowed for non-root users
sudo sysctl -w net.ipv4.ip_unprivileged_port_start=22;