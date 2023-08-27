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
