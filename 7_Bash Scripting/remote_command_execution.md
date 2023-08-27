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

``
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


