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

