# cpanel installer for CentOS 7 or 8, CloudLinux 7, or RHEL 7:

run "ip a" to get your network interface that's not "io"
note that value
then run: 
> curl https://raw.githubusercontent.com/westhecool/cpanel-installer/main/install.sh | bash THE-NETWORK-INTERFACE

Note: this will also install nano
