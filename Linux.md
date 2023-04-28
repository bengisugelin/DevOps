Linux is an open source operating system.
- Desktop OS:
  - Ubuntu Linux
  - Linux Mint
  - Arch Linux
  - Fedora
  - Debian
  - OpenSuse
- Server Linux OS
  - Red Hat Enterprise Linux (not open source)
  - Ubuntu Server
  - Centos
  - SUSE Enterprise Linux 
 There are a lot of other linux distributions: [https://en.wikipedia.org/wiki/List_of_Linux_distributions]
 
 **Most used Linux distros currently in IT industry**
 - RPM based: - RHEL (Red hat Enterprice Linux), Centos, Oracle Linux
 - Debian based :- Ubuntu Server, Kali Linux
 
 The major difference between these two family of operating systems is packaging method of the software. Red hat is considered as stable and secure operating system
# Commands
Syntax, help & lots of commands
1. Open the Git Bash and bring up our VM. go to the location that your centos placed
```
$ cd /c/vagrant-vms/centos7/
$ vagrant up
$ vagrant ssh
```
Now, very basic commands: 
- whoami see what user you are
```
[vagrant@centos ~]$ whoami
vagrant

```
- cat for reading a file
```
[vagrant@centos ~]$ cat /etc/os-release
```
This file will tell you in linux, whic operating system it is and what version.

Let's switch to root user:
```
[vagrant@centos ~]$ sudo -i
[root@centos ~]# whoami
root
[root@centos ~]# cd /
[root@centos /]# pwd
/
[root@centos /]# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  vagrant  var
[root@centos /]# cd /bin
[root@centos bin]# ls
[                                   gpasswd                nisdomainname             showconsolefont
a2p                                 gpg                    nl                        show-installed
ab                                  gpg2                   nl-addr-add               showkey
abs2rel                             gpg-agent              nl-addr-delete            shred
addr2line                           gpgconf                nl-addr-list              shuf
alias                               gpg-connect-agent      nl-class-add              signver
alt-java                            gpg-error              nl-class-delete           size
apropos                             gpgparsemail           nl-classid-lookup         skill
ar                                  gpgsplit               nl-class-list             slabinfo
arch                                gpgv                   nl-cls-add                slabtop
as                                  gpgv2                  nl-cls-delete             sleep
aserver                             gpg-zip                nl-cls-list               slogin
aulast                              gpic                   nl-fib-lookup             snice

....continues
```
These commands are the commands that can be used by the normal user like whoami, pwd etc.

if we go to the sbin directory, then we will see the commands that can be used by root users
```
[root@centos bin]# cd /sbin
[root@centos sbin]# ls
accessdb              genhostid                  mkswap                      selinuxexeccon
addgnupghome          genl                       modinfo                     selinux_restorecon
addpart               genl-ctrl-list             modprobe                    semodule
adduser               getcap                     mount.cifs                  sendmail
agetty                getenforce                 mount.nfs                   sendmail.postfix
alternatives          getpcaps                   mount.nfs4                  service
anacron               getsebool                  mountstats                  sestatus

....continues
```
# Files
understanding, editing, filtering & security

# Softwares

# Servers
