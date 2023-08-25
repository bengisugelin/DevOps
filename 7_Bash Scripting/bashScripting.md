# VM Setup

in this session, we will create three virtual machines where we can practice our bash scripts.

First, you need to create a directory somewhere in your system and put the vagrant file in it.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/5c905eba-a820-4f9c-8ca6-34c5d8f7e172)

Lets bring it up the the first one (scriptbox)

```
$ vagrant up scriptbox
```

log in to it
```
$ vagrant ssh scriptbox
```

be a root user and set a hostname
```
[root@scriptbox ~]# hostname scriptbox
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/4456b24a-2654-46d6-ac7a-1f2800f6e15c)

now, we will write our first script and we will place it in a directory..

```
[root@scriptbox ~]# mkdir /opt/scripts
[root@scriptbox ~]# cd /opt/scripts/
[root@scriptbox scripts]# ls
```

were going to install vim first.
```
[root@scriptbox scripts]# yum install vim -y

```
then, create an sh file for bash scripting.

```
[root@scriptbox scripts]# vim firstscript.sh
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/6c87b2a9-0fed-493b-96f6-5e87b09a266e)

when we tried to execute it, we will get an permission denied error.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/cd4c6e7c-8d7e-4447-8eaf-72f2f5a83e8f)

in order to run it, we need to give executable permission

```
[root@scriptbox scripts]# chmod +x firstscript.sh
```
now if we run it, it should work.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/6c7f1991-ca11-4090-976c-16cb7faf3b05)



