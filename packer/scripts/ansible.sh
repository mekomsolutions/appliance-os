#!/bin/sh -eux
echo "installing pip3"
if [ -f "/bin/dnf" ]; then
    dnf install -y --skip-broken python3-pip || true # not all these packages are on every system
elif [ -f "/bin/yum" ] || [ -f "/usr/bin/yum" ]; then
    yum install -y --skip-broken python3-pip || true # not all these packages are on every system
elif [ -f "/usr/bin/apt-get" ]; then
    apt install -y python3-pip
elif [ -f "/usr/bin/zypper" ]; then
    zypper install -y python3-pip
fi

echo "installing Ansible"
pip3 install ansible
