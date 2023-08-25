Let's see how we can store the variables and can retrieve them fro the bas shell.

store a variable:
```
[root@scriptbox ~]# SKILL="DevOps"
```
to retrieve it, just put a $ signt before the name of the variable:
```
[root@scriptbox ~]#  echo $SKILL
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/eb639f84-0e1a-4de9-a0a3-40ac9adc9274)

here another variable and its usage:
```
[root@scriptbox ~]# PACKAGE = "httpd wget unzip"
[root@scriptbox ~]# yum install $PACKAGE -y
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/75ca1e6f-cf01-42e8-9979-1876cb414974)


Let's implement this knowledge in our Web setup script.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/c709015b-d7ce-479e-8b0e-c41a2175ebe8)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/f6f383b7-b2a8-4a71-bc3c-aa41672254fe)

Before we execute this. we will dismantle everything.For that, we will write a script to remove it, actually remove the service and all the data firs,and then we'll execute the script.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/a04593ed-0f69-46fa-8e0e-8ff2783f684c)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/955328d3-b229-4be2-9da6-94911de6bbe9)

now let's run our script.
```
[root@scriptbox scripts]# ./3_vars_websetup.sh
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/58fb630d-3c3a-4e3c-a5c5-0cc8a63ceaed)

let's check the browser:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/5f55828f-655b-413e-8625-337e07c31976)

It works completely fine! YAY!
