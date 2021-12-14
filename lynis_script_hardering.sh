#! /bin/bash

# [ACCT-9626]
dnf -y install sysstat
systemctl enable sysstat
systemctl start sysstat

# [FILE-6410]
updatedb

# [PRNT-2308] disable servers cups
systemctl stop cups
systemctl disable cups

# [STRG-1840]
rm /etc/modprobe.d/blacklist-firewire.conf || true
echo "blacklist firewire-core" > /etc/modprobe.d/blacklist-firewire.conf

# [USB-1000]
rm /etc/modprobe.d/blacklist-usb-storage.conf || true
echo "blacklist usb-storage" > /etc/modprobe.d/blacklist-usb-storage.conf

# [NAME-4404]
echo -e "$(hostname -I | awk '{print $1}')\t$(hostname)" >> /etc/hosts

# [NETW-3200]
rm /etc/modprobe.d/CIS.conf || true
echo "install cramfs /bin/true" > /etc/modprobe.d/CIS.conf
echo "install vfat /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install squashfs /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install udf /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install usb-storage /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install dccp /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install sctp /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install rds /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install tipc /bin/true" >> /etc/modprobe.d/CIS.conf

# [SSH-7408]
sed -i 's/^.*LogLevel .\+$/LogLevel VERBOSE/g' /etc/ssh/sshd_config
sed -i 's/^.*PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/^.*MaxAuthTries .\+$/MaxAuthTries 3/g' /etc/ssh/sshd_config
sed -i 's/^.*MaxSessions .\+$/MaxSessions 2/g' /etc/ssh/sshd_config
sed -i 's/^.*IgnoreRhosts .\+$/IgnoreRhosts yes/g' /etc/ssh/sshd_config
sed -i 's/^.*PermitEmptyPasswords .\+$/PermitEmptyPasswords no/g' /etc/ssh/sshd_config
sed -i 's/^.*AllowAgentForwarding .\+$/AllowAgentForwarding no/g' /etc/ssh/sshd_config
sed -i 's/^.*AllowTcpForwarding .\+$/AllowTcpForwarding no/g' /etc/ssh/sshd_config
sed -i 's/^.*X11Forwarding .\+$/X11Forwarding no/g' /etc/ssh/sshd_config
sed -i 's/^.*TCPKeepAlive .\+$/TCPKeepAlive no/g' /etc/ssh/sshd_config
sed -i 's/^.*PermitUserEnvironment .\+$/PermitUserEnvironment no/g' /etc/ssh/sshd_config
sed -i 's/^.*Compression .\+$/Compression no/g' /etc/ssh/sshd_config
sed -i 's/^.*ClientAliveCountMax .\+$/ClientAliveCountMax 2/g' /etc/ssh/sshd_config

# [FILE-7524]
chmod 600 /boot/grub2/grub.cfg
chmod 600 /etc/at.deny
chmod 600 /etc/cron.deny
chmod 600 /etc/crontab
chmod 700 /etc/cron.d
chmod 700 /etc/cron.daily
chmod 700 /etc/cron.hourly
chmod 700 /etc/cron.weekly
chmod 700 /etc/cron.monthly

# [HRDN-7222]
chmod o-rx /usr/bin/gcc
chmod o-rx /usr/bin/as

# [BANN-7126]
cp /etc/issue /etc/issue.bk
echo "Unauthorized access to this machine is prohibited" > /etc/issue
echo "Press <Ctrl-D> if you are not an authorized user" >> /etc/issue
echo "" >> /etc/issue

# [BANN-7130] 
cp /etc/issue.net /etc/issue.net.bk
echo "Unauthorized access to this machine is prohibited" > /etc/issue.net
echo "Press <Ctrl-D> if you are not an authorized user" >> /etc/issue.net
echo "" >> /etc/issue.net

