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

lets create some directories
```
[vagrant@centos ~]$ mkdir dev
[vagrant@centos ~]$ mkdir ops backupdir
[vagrant@centos ~]$ ls
backupdir  dev  firstfile.txt  ops
[vagrant@centos ~]$ pwd
/home/vagrant
```
and some files:
```
[vagrant@centos ~]$ touch  testfile1.txt
[vagrant@centos ~]$ ls
backupdir  dev  firstfile.txt  ops  testfile1.txt
[vagrant@centos ~]$ touch devopsfile{1..10}.txt
[vagrant@centos ~]$ ls
backupdir         devopsfile1.txt  devopsfile4.txt  devopsfile7.txt  firstfile.txt
dev               devopsfile2.txt  devopsfile5.txt  devopsfile8.txt  ops
devopsfile10.txt  devopsfile3.txt  devopsfile6.txt  devopsfile9.txt  testfile1.txt
```
copying file(s)
```
cp devopsfile1.txt dev/
[vagrant@centos ~]$ ls dev
devopsfile1.txt
[vagrant@centos tmp]$ cp /home/vagrant/devopsfile2.txt /home/vagrant/dev/
[vagrant@centos ~]$ cp -r dev backupdir/
[vagrant@centos ~]$ ls backupdir/
dev

```

## Syntax 

**command   options    arguments**
    cp        -r      dev backupdir/
    ls        -l         /tmp/

there are a lot of options but we dont really have to remember all of them. using --help option, we can learn everything about a command.
```
[vagrant@centos ~]$ cp --help
Usage: cp [OPTION]... [-T] SOURCE DEST
  or:  cp [OPTION]... SOURCE... DIRECTORY
  or:  cp [OPTION]... -t DIRECTORY SOURCE...
Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.

Mandatory arguments to long options are mandatory for short options too.
  -a, --archive                same as -dR --preserve=all
      --attributes-only        don't copy the file data, just the attributes
      --backup[=CONTROL]       make a backup of each existing destination file
  -b                           like --backup but does not accept an argument
      --copy-contents          copy contents of special files when recursive
  -d                           same as --no-dereference --preserve=links
  -f, --force                  if an existing destination file cannot be
                                 opened, remove it and try again (this option
                                 is ignored when the -n option is also used)
  -i, --interactive            prompt before overwrite (overrides a previous -n
                                  option)
  -H                           follow command-line symbolic links in SOURCE
  -l, --link                   hard link files instead of copying
  -L, --dereference            always follow symbolic links in SOURCE
  -n, --no-clobber             do not overwrite an existing file (overrides
                                 a previous -i option)
  -P, --no-dereference         never follow symbolic links in SOURCE
  -p                           same as --preserve=mode,ownership,timestamps
      --preserve[=ATTR_LIST]   preserve the specified attributes (default:
                                 mode,ownership,timestamps), if possible
                                 additional attributes: context, links, xattr,
                                 all
  -c                           deprecated, same as --preserve=context
      --no-preserve=ATTR_LIST  don't preserve the specified attributes
      --parents                use full source file name under DIRECTORY
  -R, -r, --recursive          copy directories recursively
      --reflink[=WHEN]         control clone/CoW copies. See below
      --remove-destination     remove each existing destination file before
                                 attempting to open it (contrast with --force)
      --sparse=WHEN            control creation of sparse files. See below
      --strip-trailing-slashes  remove any trailing slashes from each SOURCE
                                 argument
  -s, --symbolic-link          make symbolic links instead of copying
  -S, --suffix=SUFFIX          override the usual backup suffix
  -t, --target-directory=DIRECTORY  copy all SOURCE arguments into DIRECTORY
  -T, --no-target-directory    treat DEST as a normal file
  -u, --update                 copy only when the SOURCE file is newer
                                 than the destination file or when the
                                 destination file is missing
  -v, --verbose                explain what is being done
  -x, --one-file-system        stay on this file system
  -Z                           set SELinux security context of destination
                                 file to default type
```

These are the options of cp command. 

# Files
understanding, editing, filtering & security
## VIM editor
First we need to instal vim editor:
```
[vagrant@centos ~]$ sudo yum install vim -y
```
to run the command vim and a file name:
```
vim firstfile.txt
```
There are 3 modes: Command mode, Insert mode (edit mode), and extended command mode
when you press "i" , you will change to the insert mode, now you can edit the file. 

You can use cat command to read the file.

for line numbering in vim: 
```
:se nu
```
to go to the first line: use gg

to go to the end of the file: shift + g

to copy a line: yy

to copy more than one line: go to the first line, then write how many lines vill e copied and then yy: for 4 lines: 4yy

to past it: p

to delete/cut : dd

to delete/cut more than one line: number dd : 4dd

undo: u

seraching /search word. if you are looking for a word network, then: /network

## Type of Files

- **Regular file:** Normal files such as text, data, or executable files
- **Directory (d) :** Files that are lists of other files
- **Link (l) :** A shortcut that for input to the location of the actual file
-  **Special file (c):** Mechanism used for input and output, such as files in /dev
-  **Socket (s):** A special file that provides inter-process networking protected by the file systems's access control
-  **Pipe (p):** A special file that allows processes to communicate with each other without using network socket semantics

to find the type of a file, use file command:

```
[root@centos ~]# file anaconda-ks.cfg
anaconda-ks.cfg: ASCII text

[root@centos bin]# file yum
yum: Python script, ASCII text executable

[root@centos bin]# file /bin/pwd
/bin/pwd: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=8f1d0ff9fee13b5d44a1189122856912af0486bc, stripped

[root@centos ~]# file devopsdir/
devopsdir/: directory
```

When we have a file we regularyly need to acces, but it is so many levels in, then we can create a link for that file. 

Let's say we have a command.txt file inside /opt/dev/ops/devops/test path. then,

```
[root@centos ~]# ln -s /opt/dev/ops/devops/test/commands.txt cmds
[root@centos ~]# ls -l
total 2840
-rw-------. 1 root root    2331 Jan  8 23:46 anaconda-ks.cfg
lrwxrwxrwx. 1 root root      36 Jan  8 22:09 cmds -> /opt/dev/ops/devops/test/command.txt
```

In order to delete the link, we can use rm command or unlink command

``` 
unlink cmds
```

if you want to order the files (latest first oldest last) , you can use t option:

```
ls -lt
```

if you want to see oldest first and atest last, then add the r option to reverse it.

``` 
ls -ltr
```

## Filtering 
 - **Grep ** command is used to find text from any text input

```
[root@centos ~]# grep firewall anaconda-ks.cfg
[root@centos ~]# grep -i firewall anaconda-ks.cfg ( -i disables case sensitivity and shows all od them)
```

what is we are looking for multiple files? So, I am looking for a content in the current directory

```
grep -i firewall *
```

If you dont know the content your looking for is tin the current directory or one of its subdirectories, then you can use -R option, wihic will search through every single subdirectory to find a match

```
[root@centos ~]# grep -R SELINUX /etc/*
grep: /etc/alternatives/mta-mailqman: No such file or directory
grep: /etc/alternatives/mta-newaliasesman: No such file or directory
grep: /etc/alternatives/mta-sendmailman: No such file or directory
grep: /etc/alternatives/mta-aliasesman: No such file or directory
/etc/selinux/targeted/contexts/x_contexts:property _SELINUX_*                   system_u:object_r:seclabel_xproperty_t:s0
/etc/selinux/config:# SELINUX= can take one of these three values:
/etc/selinux/config:SELINUX=disabled
/etc/selinux/config:# SELINUXTYPE= can take one of three values:
/etc/selinux/config:SELINUXTYPE=targeted
/etc/sysconfig/selinux:# SELINUX= can take one of these three values:
/etc/sysconfig/selinux:SELINUX=disabled
/etc/sysconfig/selinux:# SELINUXTYPE= can take one of three values:
/etc/sysconfig/selinux:SELINUXTYPE=targeted
```

So if you dont know one setting, you can search for that setting using grep command to see it.

Another option with grep is -v which allows us to search content without a specific word. For instance, if we dont want to see anything contains firewall, then,

```
grep -vi firewall anaconda-ks.cfg 
```
- **Less**  less is a reader, so you can use up arrow down arrow, you can read the content
```
less  anaconda-ks.cfg 
```
- **more** is similar to less, but you cannot use ip and down arrows, you have to use enter and return keys
 ```
more  anaconda-ks.cfg 
```

sometimes you only need to see very first lines of the file, in these cases, you can use head command. it will show you first 10 lines of the file
 ```
head  anaconda-ks.cfg 
```

but if you want to see the first 20 lines, you can change it to 20 :

 ```
head -20  anaconda-ks.cfg 
```

The opposite of head is tail. It will show you the last 10 lines of the file, and you can also change the line number you want to see as well.

 ```
head  anaconda-ks.cfg 
```

passwd file inside the etc contains user information ( all the users in our systems). But there are a lot of info and I only want to have usernames for instance. Whatever we want, we can get from this file, because this file is properly segregated into rows and columns ( using :). First column is user name. as we have a delimiter :, we can use cut command.

```
[root@centos ~]# cat /etc/passwd
[root@centos ~]# cut -d: -f1 /etc/passwd
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
operator
games
ftp
nobody
```

If we dont have a proper delimiter, then there is an amazing filter tool, awk. awk has a lot of options.
```
[root@centos ~]# awk -F':' '{print $1}' /etc/passwd

```
to change something inside a file, we have a few options. let's say this is our file and we want to change coronavirus to covid19

```
[root@centos ~]# cat samplefile.txt
Moderna has create vaccine for coronavirus.
for corona virus pfizer has also created vaccine.
coronavirus spreads through water droplets in the air, coronavirus is a pandemic.
```
1. we can use vim editor. After opening the file, 

```
:%scoronavirus/covid19  (search for coronavirus and relace it with covid19)
:%s/covid19//g  (search for covid19 and replace it with nothing)
```
2. you can do it with sed command. using sed command, you can do it out of vim editor and with multiple files.

```
[root@centos ~]# sed 's/coronavirus/covid19/g' *  (find all files contains coronavirus in the current directory and replace them with covid19)

```
But when you do it with sed command, it will just print it on the screen, it will not actually change the file. if you want to change it, you should use the option -i
```
[root@centos ~]# sed -i 's/coronavirus/covid19/g' *  

```
## IO direction
Redirection is a process where we can copy the output of any command(s), file(s) into a new file. There are two ways of redirecting the output into a file.

using **>** or **>>filename** 

```
[root@centos ~]# uptime > /tmp/sysinfo.txt
[root@centos ~]# cat /tmp/sysinfo.txt
 18:43:57 up  1:41,  2 users,  load average: 0.00, 0.01, 0.01
 
[root@centos ~]# ls > /tmp/sysinfo.txt
[root@centos ~]# cat /tmp/sysinfo.txt
anaconda-ks.cfg
cmds
devopsdir
httpd-2.4.6-95.el7.centos.x86_64.rpm
original-ks.cfg
samplefile.txt
tree-1.6.0-10.el7.x86_64.rpm

```
so if you use >, it will overrite. If you want to append it, then use >>. 

```
[root@centos ~]# uptime >> /tmp/sysinfo.txt
[root@centos ~]# cat /tmp/sysinfo.txt
anaconda-ks.cfg
cmds
devopsdir
httpd-2.4.6-95.el7.centos.x86_64.rpm
original-ks.cfg
samplefile.txt
tree-1.6.0-10.el7.x86_64.rpm
 18:45:57 up  1:43,  2 users,  load average: 0.00, 0.01, 0.01
```
To see the memory utilization use free -m

```
[root@centos ~]# free -m
              total        used        free      shared  buff/cache   available
Mem:            486          91         289           4         105         378
Swap:          1023           0        1023

```
Mem means RAM, Swap is the virtual memory

To see the hard disk partition utilization, use df -h

```
[root@centos ~]# df -h
Filesystem               Size  Used Avail Use% Mounted on
devtmpfs                 232M     0  232M   0% /dev
tmpfs                    244M     0  244M   0% /dev/shm
tmpfs                    244M  4.6M  239M   2% /run
tmpfs                    244M     0  244M   0% /sys/fs/cgroup
/dev/mapper/centos-root   50G  2.0G   49G   4% /
/dev/sda1               1014M  168M  847M  17% /boot
/dev/mapper/centos-home   28G   33M   28G   1% /home
vagrant                  454G  308G  146G  68% /vagrant
tmpfs                     49M     0   49M   0% /run/user/1000
```

```
[root@centos ~]# date > /tmp/sysinfo.txt
[root@centos ~]# echo "#########################################" >> /tmp/sysinfo.txt
[root@centos ~]# uptime >> /tmp/sysinfo.txt
[root@centos ~]# echo "#########################################" >> /tmp/sysinfo.txt
[root@centos ~]# free -m >> /tmp/sysinfo.txt
[root@centos ~]# echo "#########################################" >> /tmp/sysinfo.txt
[root@centos ~]# df -h >> /tmp/sysinfo.txt                                      [root@centos ~]# cat /tmp/sysinfo.txt
Mon May  1 18:58:09 UTC 2023
#########################################
 18:58:22 up  1:55,  2 users,  load average: 0.00, 0.01, 0.01
#########################################
              total        used        free      shared  buff/cache   available
Mem:            486          91         289           4         105         377
Swap:          1023           0        1023
#########################################
Filesystem               Size  Used Avail Use% Mounted on
devtmpfs                 232M     0  232M   0% /dev
tmpfs                    244M     0  244M   0% /dev/shm
tmpfs                    244M  4.6M  239M   2% /run
tmpfs                    244M     0  244M   0% /sys/fs/cgroup
/dev/mapper/centos-root   50G  2.0G   49G   4% /
/dev/sda1               1014M  168M  847M  17% /boot
/dev/mapper/centos-home   28G   33M   28G   1% /home
vagrant                  454G  308G  146G  68% /vagrant
tmpfs                     49M     0   49M   0% /run/user/1000
```

If you dont want to redirect or see anywhere, then you can send this file to /dev/null

You can also use this dev/null to clear the content of another file ( this trick will be very handy in bash scripting)
```
[root@centos ~]# cat /dev/null > /tmp/sysinfo.txt
[root@centos ~]# cat /tmp/sysinfo.txt
[root@centos ~]#

```

## Piping

```
[root@centos ~]# cd /etc/
[root@centos etc]# ls | wc -l
198
[root@centos etc]# ls | grep host
host
host.conf
hostname
hosts
hosts.allow
hosts.deny
[root@centos etc]# tail /var/log/messages | grep -i vagrant
May  1 17:04:16 centos systemd: Started Session 3 of user vagrant.
May  1 17:04:16 centos systemd-logind: New session 3 of user vagrant.
[root@centos etc]# free -m | grep Mem
Mem:            486    
\[root@centos etc]# ls -l | tail
-rw-r--r--.  1 root root     1982 Dec 15  2020 vimrc
-rw-r--r--.  1 root root     1982 Dec 15  2020 virc
-rw-r--r--.  1 root root     4479 May 15  2019 wgetrc
drwxr-xr-x.  2 root root       33 Jan  5 03:32 wpa_supplicant
drwxr-xr-x.  5 root root       57 Jan  5 03:27 X11
drwxr-xr-x.  4 root root       38 Jan  5 03:27 xdg
drwxr-xr-x.  2 root root        6 Apr 11  2018 xinetd.d
drwxr-xr-x.  6 root root      100 Jan  5 03:27 yum
-rw-r--r--.  1 root root      970 Oct  1  2020 yum.conf
drwxr-xr-x.  2 root root     4096 Jan 10 07:31 yum.repos.d
[root@centos etc]# ls -l | head
total 1172
-rw-r--r--.  1 root root       18 Jan  5 03:29 adjtime
-rw-r--r--.  1 root root     1529 Apr  1  2020 aliases
-rw-r--r--.  1 root root    12288 Jan  4 22:35 aliases.db
drwxr-xr-x.  2 root root     4096 Jan 10 07:30 alternatives
-rw-------.  1 root root      541 Jan 13  2022 anacrontab
-rw-r--r--.  1 root root       55 Aug  8  2019 asound.conf
drwxr-x---.  3 root root       43 Jan  5 03:27 audisp
drwxr-x---.  3 root root       83 Jan  4 22:35 audit
drwxr-xr-x.  2 root root       44 Jan  5 03:57 bash_completion.d
[root@centos etc]#
```

**find command**
If we want to find files starting with host in the home directory (real-time search) :

```
[root@centos ~]# find /etc -name host*
/etc/host
/etc/host.conf
/etc/hosts
/etc/hosts.allow
/etc/hosts.deny
/etc/selinux/targeted/active/modules/100/hostname
/etc/hostname
```

One easy way of searching is also through locate command, but it will not be installed by default. so, first you ned to install it. It is not a real-time search, so yu neeed to update the db before searching. 
```
[root@centos ~]# yum install mlocate

[root@centos ~]# updatedb
[root@centos ~]# locate host
/dev/vhost-net
/etc/host
/etc/host.conf
/etc/hostname
/etc/hosts
..continues..
```

## Users & Groups

### Users
- Users and groups are used to control access to files and resources
- Users login to system by supplying their username ad password
- Every file on the system is owned by a user and associated with a group
- Every process has an owner and group affiliation, and can only access the resources its owner or group can access
- Every user of the system is assigned a unique user ID number (the UID)
- User's name and UID are stored in /etc/passwd
- User's password is stored in /etc/shadow in encrpted form
- Users are assigned a home directory and a program that is run when they log in (Usually a shell)
- Users cannot read, write or execute each other's files without permission.

**Types of user**
1. Root -> user id: 0, group id: 0, home dir: /root, shell: /bin/bash
2. Regular -> user id: 1000 to 60000, group id: 1000 to 60000, Home dir: /home/username, shell: /bin/bash
3. Service (ftp, ssh, apache etc) -> user id: 1 to 999, Group id: 1 to 999, home dir: /var/ftp etc, shell: /sbin/nologin 

```
[root@centos ~]# head -1 /etc/passwd
root:x:0:0:root:/root:/bin/bash

root    :        x       :   0  :   0   : root  : /root :/bin/bash
username:linktoshadowfile:userid:groupid:comment:homedir:shell
```
Let's search for vagrant user:
```
[root@centos ~]# grep vagrant /etc/passwd
vagrant:x:1000:1000:vagrant:/home/vagrant:/bin/bash

vagrant :  x  : 1000 :  1000 :vagrant:/home/vagrant:/bin/bash
username: link:userid:gropuid:comment:   homedir   :shell
```
And system users:

```
[root@centos ~]# cat /etc/passwd
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin

```

# Softwares

# Servers
