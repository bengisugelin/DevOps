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

## first script
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

but. let's make the output more readable.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/1300ec8f-a8e7-4851-ba4e-69f17a410a6f)


## Sample script

now, we will take a sample use case, we have some ccommand which they will set up a website for us. So instead of doing that manually, running all the commands, we will write a script to do that.

create the file
```
[root@scriptbox scripts]#  vim /opt/scripts/websetup.sh
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/661038cc-548f-41da-8136-4c70a0553c40)

give the execute permission
```
[root@scriptbox scripts]# chmod +x /opt/scripts/websetup.sh
```

lets execute it now,

```
[root@scriptbox scripts]# /opt/scripts/websetup.sh
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/20a29c95-d18b-4897-866a-559c3a6bfea7)

now its time to test it. get the ip address:
```
[root@scriptbox scripts]# ifconfig
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/bc07fb9b-2d07-4fbb-a6ec-4f1544a6a882)

open that in the browser
![image](https://github.com/bengisugelin/DevOps/assets/113550043/0949f223-5868-4c18-9c73-5dd83d5e4738)
and set up is complete!

## Quotes

there are two different quotes: "" and ''

let's say we have var'able SKILL

```
[vagrant@scriptbox scripts]$ SKILL="DevOps"
```

is I print that:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/20dc99f0-e2c8-45d0-a5f4-4b45c887b3fe)

What if we used '' instead of "" ?

there will not be any difference in printing it

![image](https://github.com/bengisugelin/DevOps/assets/113550043/2bf8db22-5d16-4c8a-87b1-d88f6c115ddd)

but. let's try to print it in double quote as a sentence that we need this variable

![image](https://github.com/bengisugelin/DevOps/assets/113550043/35cd98ca-790d-442a-8a0d-aeadbb83b0a1)

do the same thing with single quote:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/ad7c9632-76b0-43b0-a63e-c345a4a6c6b1)

it didnt work at all.. so single quotes removes the meaning of a special character.


## Command substitution:

if we want to assign a variable for a known command, we should use back ticks.
```
[vagrant@scriptbox scripts]$ UP=`uptime`
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/3d2dcf97-9265-44f9-aa6a-90941c494543)

otherwise, it will only store the word, not the command.

another example:

```
[vagrant@scriptbox scripts]$ FREE_RAM=`free -m | grep Mem \ awk '{print $4}'`
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/f9cd3569-fab1-4373-8116-6e9b683159b1)

Let's create a simple script that will print system info or healht of thhe system.
```
[root@scriptbox scripts]# vim 6_command_subs.sh
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/780ccb8b-5d69-4837-933c-98fcff01e626)

```
[root@scriptbox scripts]# chmod +x 6_command_subs.sh
[root@scriptbox scripts]# ./6_command_subs.sh
```


