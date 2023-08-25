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
