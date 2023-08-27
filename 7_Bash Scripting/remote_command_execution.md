We will talk about a remote execution, how we can execute command promt script box to Web01 and web02 vms

lets create those vm

![image](https://github.com/bengisugelin/DevOps/assets/113550043/af776b24-d20c-45c3-817c-8ff18e221ce7)

this is the Vagrant file we have. In order to set up these VMs, we just need to say 

```
$ vagrant up
```
let's get the ip address of the machines. We are going to add name to IP mapping in the script box. So script box can refer to all the achines with the names and not the IP addresses. But first we have to save those same IP addresses in the /etc/host file

lets log in to scriptbox and open that file.

```
$ vagrant ssh scriptbox
[vagrant@scriptbox ~]$ sudo -i
[root@scriptbox ~]# vim /etc/hosts
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/21f4602d-0881-42d0-b1c6-2aa0559bd01d)

now let's try tpo ping web01 from scriptbox

![image](https://github.com/bengisugelin/DevOps/assets/113550043/6dc392d8-dddf-4f27-b856-049e5bd2be88)

you can do the same thing for web02 and web03.

lets do some tests

```
[root@scriptbox ~]# ssh vagrant@web01
The authenticity of host 'web01 (192.168.10.13)' can't be established.
ECDSA key fingerprint is SHA256:mc0p/z9/+4s4SjrnLCx/tV2t8ziWNB049IHGz1V0a8U.
ECDSA key fingerprint is MD5:06:81:b2:a2:92:4e:a4:cf:a8:57:8a:5b:90:cd:00:d5.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'web01,192.168.10.13' (ECDSA) to the list of known hosts.
vagrant@web01's password:
Last login: Sun Aug 27 23:14:14 2023 from 10.0.2.2
[vagrant@web01 ~]$
```

now, we are conntected to web01 machine.
```
[vagrant@web01 ~]$ hostname
web01
```

we can log out now,
```
Connection to web01 closed.
[root@scriptbox ~]#
```

So, lets not use the vagrant user. We will create another user, devops, for every VM.

log in to web01 again from scriptbox
```
[root@scriptbox ~]# ssh vagrant@web01
```
create a new user named devops, set password  as devops
```
[vagrant@web01 ~]$ sudo -i
[root@web01 ~]# useradd devops
[root@web01 ~]# passwd devops
```
next, edit the visudo file

![image](https://github.com/bengisugelin/DevOps/assets/113550043/d6a706be-c206-4aed-b369-5027c1915621)

ADD DEVOPS USER.


Now, we will do the same thongs to web02.

But web03 is an ubuntu OS and it you cannot connect it with password.if try, it will say permision denied public. it will ask a key.

Lets logout from scriptbox and login to web03

![image](https://github.com/bengisugelin/DevOps/assets/113550043/9e9a5a64-8f7c-4553-9fe7-06e92128ba65)

open /etc/ssh/sshd_config file.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/f64e9299-5c72-42ec-a218-38b2eaf1b6c9)

as it can be seen here, password authentication is not allowed. that why we cannot logged in as we did in web01 and web02.
change it to yes to give the permission.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/fee8579a-e9b4-4f96-80ea-195b85e6bb1e)

restart the ssh service.
```
root@web03:~# systemctl restart ssh
```
now log in to scriptbox and continue.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/030d0ca8-5a13-410a-bd72-c6448e6be9e1)


let's go back to scriptbox

