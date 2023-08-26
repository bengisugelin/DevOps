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


# Command line arguments

so if we dont want to specify the variable, but enter in the command line here how we can do it:

first lets create a copy of latest websetup.sh file

```
```
and then open it and make the modification.
```
```

Comment URL and ART_NAME. now we dont have those variables. so we are not going to use that variable, but we weill use numbers(0,1,2...) instead.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/c07a1eed-0a32-458a-91ed-3e9580f1090b)

```
[root@scriptbox scripts]# ./5_args_websetup.sh https://www.tooplate.com/zip-templates/2137_barista_cafe.zip 2137_barista_cafe
```

now this is a resusable code, i can use it any different website by giving the address of the website.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/df24cc11-71a3-4420-853b-7e12b7977d78)

so, let's get the ip and see it on the browser.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/c83a0d23-cddc-4dd8-8b0a-8f6236c393d8)


## Exporting variables.

If you want to make a variable permanent, you can do it by placing it in the .bashrc file

![image](https://github.com/bengisugelin/DevOps/assets/113550043/19a623a8-47ab-4c60-b92b-d254acc7af0a)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/e8b88a8f-9a5a-4e1e-8e42-3fc757e01006)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/fe86fbbf-81e9-4354-b8fb-133558c552fc)


if you want to make it available globally for every user, then you can use the file /etc/profile

![image](https://github.com/bengisugelin/DevOps/assets/113550043/76e412c4-06cc-4712-8474-466655bb68d5)



##  user input

 let's create a new sh file.

```
[root@scriptbox scripts]# vim 7_userInput.sh
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/68f5cb28-827f-4b2c-9ee7-740a235ae951)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/9dfd2573-6ce8-4a16-97e2-c8c75f650d80)

 
