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

# Softwares

# Servers
