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
vagrant:x:1000:1000:vagrant:/home/vagrant:/bin/bash  -> user information

vagrant :  x  : 1000 :  1000 :vagrant:/home/vagrant:/bin/bash
username: link:userid:gropuid:comment:   homedir   :shell
```
And system users:

```
[root@centos ~]# cat /etc/passwd
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin

```
Let's check the group file:
```
[root@centos ~]# cat /etc/group
root:x:0:
bin:x:1:
daemon:x:2:
sys:x:3:
adm:x:4:
tty:x:5:
disk:x:6:
lp:x:7:


[root@centos ~]# grep vagrant /etc/group
vagrant:x:1000:vagrant

vagrant :  x :  1000 :vagrant  -> group information
groupname:link:groupid:username

```

id command:
```
[root@centos ~]# id vagrant
uid=1000(vagrant) gid=1000(vagrant) groups=1000(vagrant),10(wheel)

```
here, vagrant user belongs two different ggroups: vagrant and wheel.

Let's add our own user:
```
[root@centos ~]# useradd ansible
[root@centos ~]# useradd jenkins
[root@centos ~]# useradd aws

ansible:x:1001:1002::/home/ansible:/bin/bash
jenkins:x:1002:1003::/home/jenkins:/bin/bash
aws:x:1003:1004::/home/aws:/bin/bash

```

and add a group:
      
```
[root@centos ~]# groupadd devops
```
Now, I will add 3 user i have created to the devops group

```
[root@centos ~]# usermod -aG devops ansible (G means it is a secondary group, if it was g, then primary group)
[root@centos ~]# id ansible
uid=1001(ansible) gid=1002(ansible) groups=1002(ansible),1001(devops)

[root@centos ~]# grep devops /etc/group
devops:x:1001:aws,ansible,jenkins

```
Also, you can add a new user through vim editor. just open the file and write the name of the user accordingly.

Let's set a password for aws. 
```
[root@centos ~]# passwd aws
```

If you are a root user, you dont really need to know the paswword. You can reach the user using su command:
```
[root@centos ~]# su - ansible
Last login: Mon Jan  9 05:54:45 UTC 2023 on pts/3
[ansible@centos ~]$
```
I switched to ansible user without entering a password as i am a root user.

To delete the user $ group
```
[root@centos ~]# userdel aws
[root@centos ~]# userdel -r jenkins
[root@centos ~]# groupdel devops
```
## File Permissions

**Viewving Permissions from the command line**

File permissions can be viewed usin ls -l
```
[root@centos ~]# ls -l
total 2840
-rw-------. 1 root root    2331 Jan  8 23:46 anaconda-ks.cfg
lrwxrwxrwx. 1 root root      36 Jan  8 22:09 cmds -> /opt/dev/ops/devops/test/command.txt
drwxr-xr-x. 2 root root      31 Jan  8 23:49 devopsdir
-rw-r--r--  1 root root 2846172 Jan 10 07:16 httpd-2.4.6-95.el7.centos.x86_64.rpm
-rw-------. 1 root root    1557 Jan  5 03:35 original-ks.cfg
-rw-r--r--. 1 root root     164 Jan  9 02:56 samplefile.txt
-rw-r--r--  1 root root   47508 Jan 10 07:13 tree-1.6.0-10.el7.x86_64.rpm

```

Four symbols are used when displaying permissions
1. **r :** permission to read a file or list a directory's content
2. **w :** permission to write to a file or create and remove files from a directory
3. **x :** permission to execute a program or change into a directory and do a long listing of directory
4. **- :** no permission ( in place of the r,w, or x)

-rw-------. 1 root root    2331 Jan  8 23:46 anaconda-ks.cfg
here:

\- => file type

rw- => User

--- => group

--- => others


Let's change the ownership:
```
[root@centos ~]# chown -R  ansible:devops /opt/devopsdir

[root@centos ~]# ls -ld /opt/devopsdir/
drwxr-xr-x. 2 ansible devops 22 Jan  9 05:40 /opt/devopsdir/

````
-R means recursve option. be careful while using it. If you have hundreds of files and directories inside that, every file will have this user and this group ownership then. It will not be easy to roll back. So right now, devopsdir directory os owned by ansible and the group is devops and they have drwxr-xr-x permissions. full permission for ansible, read and execute permissions for group and others.  Let's remove the permission of others and add write permission to the group.
```
[root@centos ~]# chmod o-x /opt/devopsdir/
[root@centos ~]# chmod o-r /opt/devopsdir/
[root@centos ~]# chmod g+w /opt/devopsdir/
[root@centos ~]# ls -ld /opt/devopsdir/
drwxrwx---. 2 ansible devops 22 Jan  9 05:40 /opt/devopsdir/

```
Now, let's login to the user miles, which is an other user.
```
[root@centos ~]# su - miles
Last login: Mon Jan  9 05:38:10 UTC 2023 on pts/3
[miles@centos ~]$ ls /opt/devopsdir/
ls: cannot open directory /opt/devopsdir/: Permission denied
[miles@centos ~]$ cd /opt/devopsdir/
-bash: cd: /opt/devopsdir/: Permission denied
```
As you can see, since other users do not have the permission of read, write or execute, miles had a permission denied error.

But if I switch to aws user, I can read, write and execute as aws user has the permission for all of them:
```
[aws@centos ~]$ ls /opt/devopsdir/
awsfiles
[aws@centos ~]$ cd /opt/devopsdir/
[aws@centos devopsdir]$
```

**Changing permissions - Symbolic method**
- To change access modess:
    - chmod [-option]...mode[,mode] file|directry
- mode includes:
    - u, g or o for user, group and other
    - '+', '-' or '=' for grant, deny or set
    - r, w, or x for read, write and execute
- Options include:
    - -R Recursive
    - -v verbose
    - --reference Reference another file for its mode
- Examples:
    - chmod ugo+r file: grant read access to all for file
    - chmod o-wx dir: deny write and execute to others for dir
# Sudo
Sudo gives power to a normal user to execute commands which is owned by root user.

we have vagrant user, which has a privilege to execute sudo, however other users we have created such as aws or ansible cannot do use sudo command. If we want ansible to use sudo command, we need to manipulate sudoers file.

```
visudo
```
then search for /root

you can set the line number (:se nu) to easier visualization

```
## Allow root to run any commands anywhere
    100 root    ALL=(ALL)       ALL
    101
    102 ansible ALL=(ALL)       NOPASSWD: ALL
```

Now, as an ansible user, you can use sudo command.NOPASSWD: means do not ask for a password when we ara an ansible user and trying to use sudo. But if we make a typo or other mistake while editing the sudoers file, you may not be able to correct it if you dont have a root password which most of the servers will not have the root password set for security purpose. We will have normal user login like we have vagrant user. We can switch to root user by using sudo. So if we want to fix sudoers file, it will be a problem because sudo will not work and we dont have the root password.

So, the better solution is , instead of editing that sudoers file, you can go to /etc/sudoers.d directory and you can create you own file.
```
[root@centos ~]# cd /etc/sudoers.d/
[root@centos sudoers.d]# ls
vagrant
[root@centos sudoers.d]# cat vagrant
vagrant        ALL=(ALL)       NOPASSWD: ALL
```
here, we can create a file named devops by copying vagrant file as devops file:
```
[root@centos sudoers.d]# cp vagrant devops
[root@centos sudoers.d]# vim devops ( change it as %devops)

[root@centos sudoers.d]# cat *
%devops        ALL=(ALL)       NOPASSWD: ALL
vagrant        ALL=(ALL)       NOPASSWD: ALL

```
It is better and a safer way of letting users using the sudo command, in our case we gave the privilege to a group, that is, all the users inside that group.
# Softwares
We call softwares as packages in Linux.

Let's say we want to use tree command.
```
[root@centos ~]# tree /var/log
-bash: tree: command not found

```
As we can see, we dont have this package right now, so wee need to download and install the tree command. Very manual way of setting up a package is opening our browser, search for the tree package on the internet, downloand and install it [https://rpmfind.net/linux/rpm2html/search.php?query=tree&submit=Search+...&system=&arch=]. just search for tree rpm, and choose the suitable one for you OS. or copy the link address and come to the terminal:
```
[root@centos ~]# curl https://rpmfind.net/linux/centos/7.9.2009/os/x86_64/Packages/tree-1.6.0-10.el7.x86_64.rpm -o

[root@centos ~]# rpm -ivh tree-1.6.0-10.el7.x86_64.rpm ->(i for install, v for verbose, h is human readable)
Preparing...                          ################################# [100%]
Updating / installing...
   1:tree-1.6.0-10.el7                ################################# [100%]

```
After installation, you can use tree command:
```
[root@centos ~]# tree /var/log/
/var/log/
├── anaconda
│   ├── anaconda.log
│   ├── ifcfg.log
│   ├── journal.log
│   ├── ks-script-0yibYt.log
│   ├── ks-script-QiOFak.log
│   ├── ks-script-T0lvTM.log
│   ├── packaging.log
│   ├── program.log
│   ├── storage.log
│   └── syslog
├── audit
│   └── audit.log
├── boot.log
├── boot.log-20230109
├── boot.log-20230110
├── boot.log-20230429
├── boot.log-20230430
├── boot.log-20230501
├── boot.log-20230502
├── boot.log-20230503
├── btmp
├── btmp-20230501
├── chrony
├── cron
├── cron-20230429
├── cron-20230430
├── dmesg
├── dmesg.old
├── grubby
├── grubby_prune_debug
├── httpd
│   ├── access_log
│   ├── error_log
│   └── error_log-20230430
├── jenkins
├── lastlog
├── maillog
├── maillog-20230429
├── maillog-20230430
├── messages
├── messages-20230429
├── messages-20230430
├── rhsm
├── samba
│   └── old
├── secure
├── secure-20230429
├── secure-20230430
├── spooler
├── spooler-20230429
├── spooler-20230430
├── tallylog
├── tuned
│   └── tuned.log
├── vboxadd-install.log
├── vboxadd-setup.log
├── vboxadd-setup.log.1
├── vboxadd-setup.log.2
├── vboxadd-setup.log.3
├── vboxadd-setup.log.4
├── wtmp
└── yum.log

9 directories, 54 files

```
Let's install another package, httpd, which is a web server package.[https://rpmfind.net/linux/rpm2html/search.php?query=httpd&submit=Search+...&system=&arch=] find the one you want to download

```
[root@centos ~]# curl https://rpmfind.net/linux/centos/7.9.2009/os/x86_64/Packages/httpd-2.4.6-95.el7.centos.x86_64.rpm -o httpd-2.4.6-95.el7.centos.x86_64.rpm
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 2779k  100 2779k    0     0  1074k      0  0:00:02  0:00:02 --:--:-- 1074k

[root@centos ~]# rpm -ivh httpd-2.4.6-95.el7.centos.x86_64.rpm
error: Failed dependencies:
httpd-tools = 2.4.6-95.el7.centos is needed by httpd-2.4.6-95.el7.centos.x86_64

```
Here, we have a dependency problem. It says that we need to install other packages before installing this one. Here we only have one dependency. We can find it, download and install it, and then install httpd. No problem at all. But what if we have hundreds of dependencies?

And that's the case so many times. Because in Linux principle, we understood we have small single purpose programs cahined together to perform complex operations. So, we will regularly see this dependencies problem and that can be solved very easily.

Like we have rpm, whic can isntall the package or we can even uninstall package, we have other package managers also like, yum for RedHat.

Before going there, let's see some more option in RPM

```
[root@centos ~]# rpm --help
Usage: rpm [OPTION...]

Query/Verify package selection options:
  -a, --all                        query/verify all packages
  -f, --file                       query/verify package(s) owning file
  -g, --group                      query/verify package(s) in group
  -p, --package                    query/verify a package file
  --pkgid                          query/verify package(s) with package
                                   identifier
  --hdrid                          query/verify package(s) with header
                                   identifier
  --triggeredby                    query the package(s) triggered by the
                                   package
  --whatrequires                   query/verify the package(s) which require a
                                   dependency
  --whatprovides                   query/verify the package(s) which provide a
                                   dependency
  --nomanifest                     do not process non-package files as
                                   manifests

Query options (with -q or --query):
  -c, --configfiles                list all configuration files
  -d, --docfiles                   list all documentation files
  -L, --licensefiles               list all license files
  --dump                           dump basic file information
  -l, --list                       list files in package
  --queryformat=QUERYFORMAT        use the following query format
  -s, --state                      display the states of the listed files

Verify options (with -V or --verify):
  --nofiledigest                   don't verify digest of files
  --nofiles                        don't verify files in package
  --nodeps                         don't verify package dependencies
  --noscript                       don't execute verify script(s)

Install/Upgrade/Erase options:
  --allfiles                       install all files, even configurations
                                   which might otherwise be skipped
  --allmatches                     remove all packages which match <package>
                                   (normally an error is generated if
                                   <package> specified multiple packages)
  --badreloc                       relocate files in non-relocatable package
  -e, --erase=<package>+           erase (uninstall) package
  --excludedocs                    do not install documentation
  --excludepath=<path>             skip files with leading component <path>
  --force                          short hand for --replacepkgs --replacefiles
  -F, --freshen=<packagefile>+     upgrade package(s) if already installed
  -h, --hash                       print hash marks as package installs (good
                                   with -v)
  --ignorearch                     don't verify package architecture
  --ignoreos                       don't verify package operating system
  --ignoresize                     don't check disk space before installing
  -i, --install                    install package(s)
  --justdb                         update the database, but do not modify the
                                   filesystem
  --nodeps                         do not verify package dependencies
  --nofiledigest                   don't verify digest of files
  --nocontexts                     don't install file security contexts
  --noorder                        do not reorder package installation to
                                   satisfy dependencies
  --noscripts                      do not execute package scriptlet(s)
  --notriggers                     do not execute any scriptlet(s) triggered
                                   by this package
  --nocollections                  do not perform any collection actions
  --oldpackage                     upgrade to an old version of the package
                                   (--force on upgrades does this
                                   automatically)
  --percent                        print percentages as package installs
  --prefix=<dir>                   relocate the package to <dir>, if
                                   relocatable
  --relocate=<old>=<new>           relocate files from path <old> to <new>
  --replacefiles                   ignore file conflicts between packages
  --replacepkgs                    reinstall if the package is already present
  --test                           don't install, but tell if it would work or
                                   not
  -U, --upgrade=<packagefile>+     upgrade package(s)
  --reinstall=<packagefile>+       reinstall package(s)

Common options for all rpm modes and executables:
  -D, --define='MACRO EXPR'        define MACRO with value EXPR
  --undefine=MACRO                 undefine MACRO
  -E, --eval='EXPR'                print macro expansion of EXPR
  --macros=<FILE:...>              read <FILE:...> instead of default file(s)
  --noplugins                      don't enable any plugins
  --nodigest                       don't verify package digest(s)
  --nosignature                    don't verify package signature(s)
  --rcfile=<FILE:...>              read <FILE:...> instead of default file(s)
  -r, --root=ROOT                  use ROOT as top level directory (default:
                                   "/")
  --dbpath=DIRECTORY               use database in DIRECTORY
  --querytags                      display known query tags
  --showrc                         display final rpmrc and macro configuration
  --quiet                          provide less detailed output
  -v, --verbose                    provide more detailed output
  --version                        print the version of rpm being used

Options implemented via popt alias/exec:
  --scripts                        list install/erase scriptlets from
                                   package(s)
  --setperms                       set permissions of files in a package
  --setugids                       set user/group ownership of files in a
                                   package
  --setcaps                        set capabilities of files in a package
  --restore                        restore file/directory permissions
  --conflicts                      list capabilities this package conflicts
                                   with
  --obsoletes                      list other packages removed by installing
                                   this package
  --provides                       list capabilities that this package provides
  --requires                       list capabilities required by package(s)
  --info                           list descriptive information from package(s)
  --changelog                      list change logs for this package
  --xml                            list metadata in xml
  --triggers                       list trigger scriptlets from package(s)
  --last                           list package(s) by install time, most
                                   recent first
  --dupes                          list duplicated packages
  --filesbypkg                     list all files from each package
  --fileclass                      list file names with classes
  --filecolor                      list file names with colors
  --fscontext                      list file names with security context from
                                   file system
  --fileprovide                    list file names with provides
  --filerequire                    list file names with requires
  --filecaps                       list file names with POSIX1.e capabilities

Help options:
  -?, --help                       Show this help message
  --usage                          Display brief usage message
```
we can see all the options here. for instance q for query, a for all, so, rpm -qa will list all the rpms.
```
[root@centos ~]# rpm -qa
fontpackages-filesystem-1.44-8.el7.noarch
setup-2.8.71-11.el7.noarch
dejavu-sans-fonts-2.33-6.el7.noarch
authconfig-6.2.8-30.el7.x86_64
ncurses-base-5.9-14.20130511.el7_4.noarch
javapackages-tools-3.4.1-11.el7.noarch
xorg-x11-font-utils-7.5-21.el7.x86_64
...continues...
```

So if you want to search if a particular rpm is install or not, you can do it by searching it.:

```
[root@centos ~]# rpm -qa | grep tree
tree-1.6.0-10.el7.x86_64

```

So we can do a lot of configurations with rpm that can come handy while doing some troubleshooting with package management. But the better option for managing your package is **yum**.

So, instead of going on the the internet, search for rpm, download and install it, we can use yum

go to the cd /etc/yum.repos.d/ directory.
```
root@centos ~]# cd /etc/yum.repos.d/
[root@centos yum.repos.d]# ls
CentOS-Base.repo       CentOS-Media.repo          epel.repo
CentOS-CR.repo         CentOS-Sources.repo        epel-testing.repo
CentOS-Debuginfo.repo  CentOS-Vault.repo          jenkins.repo
CentOS-fasttrack.repo  CentOS-x86_64-kernel.repo
[root@centos yum.repos.d]#
```

 in this directory we should see some files points to some repositories on the internet, like for example,
 ```
 [root@centos yum.repos.d]# cat CentOS-x86_64-kernel.repo
[centos-kernel]
name=CentOS LTS Kernels for $basearch
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=kernel&infra=$infra
#baseurl=http://mirror.centos.org/altarch/7/kernel/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[centos-kernel-experimental]
name=CentOS Experimental Kernels for $basearch
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=experimental&infra=$infra
#baseurl=http://mirror.centos.org/altarch/7/experimental/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

 ```
It will have the information of the repositories.

so here when  we say yum search httpd, we are searching for a package named httpd in all those repositories.

```
[root@centos yum.repos.d]# yum search httpd
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: lesnet.mm.fcix.net
 * epel: ftp-osl.osuosl.org
 * extras: lesnet.mm.fcix.net
 * updates: lesnet.mm.fcix.net
============================== N/S matched: httpd ==============================
dmlite-apache-httpd.x86_64 : Apache HTTPD frontend for dmlite
iipsrv-httpd-fcgi.noarch : Apache HTTPD files for iipsrv
keycloak-httpd-client-install.noarch : Tools to configure Apache HTTPD as
                                     : Keycloak client
libmicrohttpd-devel.i686 : Development files for libmicrohttpd
libmicrohttpd-devel.x86_64 : Development files for libmicrohttpd
libmicrohttpd-doc.noarch : Documentation for libmicrohttpd
lighttpd-fastcgi.x86_64 : FastCGI module and spawning helper for lighttpd and
                        : PHP configuration
lighttpd-mod_authn_gssapi.x86_64 : Authentication module for lighttpd that uses
                                 : GSSAPI
lighttpd-mod_authn_mysql.x86_64 : Authentication module for lighttpd that uses a
                                : MySQL database
lighttpd-mod_authn_pam.x86_64 : Authentication module for lighttpd that uses PAM
lighttpd-mod_geoip.x86_64 : GeoIP module for lighttpd to use for location
                          : lookups
lighttpd-mod_mysql_vhost.x86_64 : Virtual host module for lighttpd that uses a
                                : MySQL database
pagure-web-apache-httpd.noarch : Apache HTTPD configuration for Pagure
python2-keycloak-httpd-client-install.noarch : Tools to configure Apache HTTPD
                                             : as Keycloak client
radicale-httpd.noarch : httpd config for Radicale
sympa-lighttpd.x86_64 : Sympa with lighttpd
darkhttpd.x86_64 : A secure, lightweight, fast, single-threaded HTTP/1.1 server
httpd.x86_64 : Apache HTTP Server
httpd-devel.x86_64 : Development interfaces for the Apache HTTP server
httpd-itk.x86_64 : MPM Itk for Apache HTTP Server
httpd-manual.noarch : Documentation for the Apache HTTP server
httpd-tools.x86_64 : Tools for use with the Apache HTTP Server
libmicrohttpd.i686 : Lightweight library for embedding a webserver in
                   : applications
libmicrohttpd.x86_64 : Lightweight library for embedding a webserver in
                     : applications
lighttpd.x86_64 : Lightning fast webserver with light system requirements
mirmon-httpd.noarch : Apache configuration for mirmon
mod_auth_mellon.x86_64 : A SAML 2.0 authentication module for the Apache Httpd
                       : Server
mod_dav_svn.x86_64 : Apache httpd module for Subversion server
opensips-httpd.x86_64 : HTTP transport layer implementation
perl-Test-Fake-HTTPD.noarch : Fake HTTP server module for testing
python2-sphinxcontrib-httpdomain.noarch : Sphinx domain for documenting HTTP
                                        : APIs
sympa-httpd.x86_64 : Sympa with Apache HTTP Server
sysusage-httpd.noarch : Apache configuration for sysusage
thttpd.x86_64 : A tiny, turbo, throttleable lightweight HTTP server
viewvc-httpd-fcgi.noarch : ViewVC configuration for Apache/mod_fcgid
viewvc-httpd-wsgi.noarch : ViewVC configuration for Apache/mod_wsgi
web-assets-httpd.noarch : Web Assets aliases for the Apache HTTP daemon

  Name and summary matches only, use "search all" for everything.
```

So if we want to install that, we basically say:

```
[root@centos yum.repos.d]# yum install httpd
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
epel/x86_64/metalink                                     |  29 kB     00:00
 * base: lesnet.mm.fcix.net
 * epel: ftp-osl.osuosl.org
 * extras: lesnet.mm.fcix.net
 * updates: lesnet.mm.fcix.net
base                                                     | 3.6 kB     00:00
epel                                                     | 4.7 kB     00:00
extras                                                   | 2.9 kB     00:00
jenkins                                                  | 2.9 kB     00:00
updates                                                  | 2.9 kB     00:00
(1/2): epel/x86_64/primary_db                              | 7.0 MB   00:00
(2/2): epel/x86_64/updateinfo                              | 1.0 MB   00:01
Resolving Dependencies
--> Running transaction check
---> Package httpd.x86_64 0:2.4.6-97.el7.centos.5 will be updated
---> Package httpd.x86_64 0:2.4.6-98.el7.centos.7 will be an update
--> Processing Dependency: httpd-tools = 2.4.6-98.el7.centos.7 for package: httpd-2.4.6-98.el7.centos.7.x86_64
--> Running transaction check
---> Package httpd-tools.x86_64 0:2.4.6-97.el7.centos.5 will be updated
---> Package httpd-tools.x86_64 0:2.4.6-98.el7.centos.7 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package           Arch         Version                     Repository     Size
================================================================================
Updating:
 httpd             x86_64       2.4.6-98.el7.centos.7       updates       2.7 M
Updating for dependencies:
 httpd-tools       x86_64       2.4.6-98.el7.centos.7       updates        94 k

Transaction Summary
================================================================================
Upgrade  1 Package (+1 Dependent package)

Total download size: 2.8 M
Is this ok [y/d/N]: y
Downloading packages:
Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
(1/2): httpd-tools-2.4.6-98.el7.centos.7.x86_64.rpm        |  94 kB   00:00
(2/2): httpd-2.4.6-98.el7.centos.7.x86_64.rpm              | 2.7 MB   00:00
--------------------------------------------------------------------------------
Total                                              4.5 MB/s | 2.8 MB  00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
Warning: RPMDB altered outside of yum.
  Updating   : httpd-tools-2.4.6-98.el7.centos.7.x86_64                     1/4
  Updating   : httpd-2.4.6-98.el7.centos.7.x86_64                           2/4
  Cleanup    : httpd-2.4.6-97.el7.centos.5.x86_64                           3/4
  Cleanup    : httpd-tools-2.4.6-97.el7.centos.5.x86_64                     4/4
  Verifying  : httpd-tools-2.4.6-98.el7.centos.7.x86_64                     1/4
  Verifying  : httpd-2.4.6-98.el7.centos.7.x86_64                           2/4
  Verifying  : httpd-tools-2.4.6-97.el7.centos.5.x86_64                     3/4
  Verifying  : httpd-2.4.6-97.el7.centos.5.x86_64                           4/4

Updated:
  httpd.x86_64 0:2.4.6-98.el7.centos.7

Dependency Updated:
  httpd-tools.x86_64 0:2.4.6-98.el7.centos.7

Complete!

```

it will download and install with its dependencies. So, no need to worry about dependencies.

If yum cannot file the package ans says  Error: nothing to do, because this package is not available in any of the repositories that are available in yum.repos.d 

Let's say we are trying to install jenkins, but we cannot do it using yum, as we encounter nothing to do error. If it is not there, we can always search for the internet, we should fin the vendor documentation. There, they will mention the steps to install a particular package. So let's take jenkings as an example. Go to your browser and search for "install jenkins". Always try to find the official documentation. in this case, [https://www.jenkins.io/doc/book/installing/]

Find the suitable command to your os

```
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install java-11-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload
```

using yum command, you can install, reinstall, remove, update the package etc.

# Services

So we have a package httpd installed, httpd is a web service
```
[root@centos ~]# systemctl status httpd
```
Righ now, this service is inactive. To activate it:
```
[root@centos ~]# systemctl start httpd
```
Let's check its status now:
```
[root@centos ~]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2023-05-03 19:59:49 UTC; 2min 11s ago
     Docs: man:httpd(8)
           man:apachectl(8)
 Main PID: 1027 (httpd)
   Status: "Total requests: 0; Current requests/sec: 0; Current traffic:   0 B/sec"
   CGroup: /system.slice/httpd.service
           ├─1027 /usr/sbin/httpd -DFOREGROUND
           ├─1279 /usr/sbin/httpd -DFOREGROUND
           ├─1281 /usr/sbin/httpd -DFOREGROUND
           ├─1282 /usr/sbin/httpd -DFOREGROUND
           ├─1283 /usr/sbin/httpd -DFOREGROUND
           └─1284 /usr/sbin/httpd -DFOREGROUND

May 03 19:59:49 centos.devops.in systemd[1]: Starting The Apache HTTP Server...
May 03 19:59:49 centos.devops.in systemd[1]: Started The Apache HTTP Server.
Hint: Some lines were ellipsized, use -l to show in full.

```
When you want to start, stop or restart the process, you can use systemctl command to do it. Like start and stop, you also have an option of restart, if you make some cganges, configuration change to your service, you can restart the service, so it will update it.

Before rebootng, the service status is active, But when I reboot the vm, status will be inactive. If we want to continue as active, then we should use following command:

```
[root@centos ~]# systemctl enable httpd
```

Now, the service will come up at the boot time.

Few other commands you want to check whether a service is running or not, you can just type this command:

```
[vagrant@centos ~]$ systemctl is-active httpd
active
```
We also have is enabled, which will tell you if the services enabled for the boot time or not.
```
[vagrant@centos ~]$ systemctl is-enabled httpd
enabled
```
# Processes
There are so many processes we will see running in the linux system, running or sleeping. There is a command, top, which will show you all the dynamic processes based on their consuption of CPU and RAM:
```
[vagrant@centos ~]$ top
top - 20:35:01 up 28 min,  1 user,  load average: 0.00, 0.01, 0.01
Tasks: 117 total,   1 running, 116 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :   498308 total,   312176 free,    83168 used,   102964 buff/cache
KiB Swap:  1048572 total,  1048572 free,        0 used.   397376 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 1029 root      20   0  437360   1848   1356 S   0.3  0.4   0:00.11 VBoxService
    1 root      20   0  125500   3972   2616 S   0.0  0.8   0:00.50 systemd
    2 root      20   0       0      0      0 S   0.0  0.0   0:00.00 kthreadd
    4 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworker/0:+
    5 root      20   0       0      0      0 S   0.0  0.0   0:00.00 kworker/u4+
    6 root      20   0       0      0      0 S   0.0  0.0   0:00.04 ksoftirqd/0
    7 root      rt   0       0      0      0 S   0.0  0.0   0:00.00 migration/0
    8 root      20   0       0      0      0 S   0.0  0.0   0:00.00 rcu_bh
    9 root      20   0       0      0      0 S   0.0  0.0   0:00.04 rcu_sched
   10 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 lru-add-dr+
   11 root      rt   0       0      0      0 S   0.0  0.0   0:00.00 watchdog/0
   12 root      rt   0       0      0      0 S   0.0  0.0   0:00.00 watchdog/1
   13 root      rt   0       0      0      0 S   0.0  0.0   0:00.00 migration/1
   14 root      20   0       0      0      0 S   0.0  0.0   0:00.03 ksoftirqd/1
   16 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworker/1:+
   18 root      20   0       0      0      0 S   0.0  0.0   0:00.00 kdevtmpfs
   19 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 netns
   20 root      20   0       0      0      0 S   0.0  0.0   0:00.00 khungtaskd
   21 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 writeback
   22 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kintegrityd
   23 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 bioset
```

to quit, press q. 

There is another command, ps aux , it is similar to top but it displays information on the screen and it just quits.
we also have ps -ef, whic is going to show all the process again, but it will show parent process id (PPID), not the utilization.

How can we stop a process? There is a command called 'kill'. If you want to stop a process you need to say kill and give the parent process id.

```
[vagrant@centos ~]$ ps -ef | grep httpd | grep -v 'grep'
root      1011     1  0 20:06 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1272  1011  0 20:06 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1273  1011  0 20:06 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1275  1011  0 20:06 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1276  1011  0 20:06 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1277  1011  0 20:06 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
```
So to kill the httpd, we shoul say, kill 1011(parent process id)
```
[root@centos ~]# kill 1011
[root@centos ~]# ps -ef | grep httpd | grep -v 'grep'
[root@centos ~]#
```
command kill is like asking to stop the porcess. Butt sometimes, processes do not listen and you have to forcefully kill them 😕

If we use -9, it becamose forceful. But when it has been done, it will only kill the parent process. and child processes will be still there and become orphan and tehy will be adopted by the first process, system process..

```
[root@centos ~]# systemctl start httpd
[root@centos ~]# ps -ef | grep httpd | grep -v 'grep'
root      1355     1  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1356  1355  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1357  1355  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1358  1355  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1359  1355  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1360  1355  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
[root@centos ~]# kill -9 1355
[root@centos ~]# ps -ef | grep httpd | grep -v 'grep'
apache    1356     1  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1357     1  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1358     1  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1359     1  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache    1360     1  0 20:54 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
```
Nowadays, systems are smart and these orphan processes will be cleared automatically. But is they dont get cleared, then you have to kill all these processes. Now we have five orphan processes, but is we have many of them, it will be difficult to do it so we can use some filtering commands.

```
[root@centos ~]# systemctl start httpd
[root@centos ~]# ps -ef | grep httpd | grep -v 'grep'|awk '{print $2}'
1381
1382
1383
1384
1385
1386
[root@centos ~]# ps -ef | grep httpd | grep -v 'grep'|awk '{print $2}' | xargs kill -9
```
 
# Archiving

**Archive**
Let's say I am int he /var/log/ directory and inside it I have jenkins directory that i wannt to archive. To do it:
```
[root@centos log]# tar -czvf jenkins_03052023.tar.gz jenkins

```
-czvf -> c: create, z : compress, v: verbose, f: file 

**Unarchive**

```
[root@centos tmp]# tar -xzvf jenkins_03052023.tar.gz
```
-xzvf -> x: extract, z : compress, v: verbose, f: file

If you want to extract another location, then use -C command.

```
[root@centos tmp]# tar -xzvf jenkins_03052023.tar.gz -C /opt/
```


You can also use zip command
```
[root@centos log]# zip -r jenkins_03052023 jenkins

[root@centos log]# unzip jenkins_03052023
```
