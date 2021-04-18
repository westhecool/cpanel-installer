echo "disableing OS firewall"
iptables-save > ~/firewall.rules
systemctl stop firewalld.service
systemctl disable firewalld.service
echo "disableing SELinux"
rm /etc/selinux/config
echo -e "# This file controls the state of SELinux on the system.\n# SELINUX= can take one of these three values:\n# enforcing - SELinux security policy is enforced.\n# permissive - SELinux prints warnings instead of enforcing.\n# disabled - No SELinux policy is loaded.\nSELINUX=disabled\n# SELINUXTYPE= can take one of these two values:\n# targeted - Only targeted network daemons are protected.\n# strict - Full SELinux protection.\nSELINUXTYPE=targeted" > /etc/selinux/config
echo "disableing the Network Manager service"
systemctl stop NetworkManager
systemctl disable NetworkManager
echo "configuring network interfaces 'io' and '$1'"
echo -e "\nNM_CONTROLLED=no" > /etc/sysconfig/network-scripts/ifcfg-io
echo -e "\nNM_CONTROLLED=no" > /etc/sysconfig/network-scripts/ifcfg-$1
systemctl enable network.service
systemctl start network.service
echo "installing perl"
yum -y install perl
echo "installing nano"
yum install nano -y
echo "runing: 'yum update'"
yum update
echo "now run: 'cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest'"
