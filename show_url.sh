if [[ $(cat /proc/sys/kernel/osrelease) =~ "WSL" ]]; then
    WSL_IP=$(ip addr show eth0 | grep "inet " | awk '{print $2}' | cut -d/ -f1);
    echo "Dashboard url: https://$WSL_IP:8443";
    echo "Add '$WSL_IP dev.mgt' to C:\Windows\System32\drivers\etc\hosts";
else
    echo "Dashboard url: https://127.0.0.1:8443";
    echo "Add '127.0.0.1 dev.mgt' to /etc/hosts"
fi
