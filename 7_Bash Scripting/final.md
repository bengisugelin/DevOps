rather than log in manually to the every server, let's automate it.

create a new directory and a file
```
[root@scriptbox scripts]# mkdir remote_websetup
[root@scriptbox scripts]# cd remote_websetup/
[root@scriptbox remote_websetup]# vim remhosts
```
inside this remhost file, place all the server you are working on.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/64427ebf-c794-4ef0-ac9c-945de433060f)

now, we will log in all of then by looping this file.
```
[root@scriptbox remote_websetup]# for host in `cat remhosts`; do ssh devops@$host hostname;done
```

so if we want to ssee the uptime command:
```
[root@scriptbox remote_websetup]# for host in `cat remhosts`; do ssh devops@$host uptime;done
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/13194e3c-2bb2-445f-96c0-64e8f000610c)


so if you want to install a software for instance, you dont have to do it one by one manually. we only need we line of code to do it.

we have 2 CentOS and 1 linux vm right now, and installation commands are different. for CentOS we shoul yum. but for linux it is apt. so, we need to do some modifications in websetup file.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/715cf5a9-45b2-48bd-aeb0-3b72ef17e0fd)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/3b3139da-668e-4045-9c29-5f185083a1f5)

(All content of the file can be find in 7_Bash Scripting directory.)

let's test the script locally:

```
 ./multios_websetup.sh
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/235bc1d3-0e95-4964-9bde-730ed84e8e7a)

now, we will push the script to all remote machines, web01, web02 and web03 and then execute it. for this, we need to write another script.

create a test.txt file. let's push it to another machine.

```
[root@scriptbox remote_websetup]# scp testfile.txt devops@web01:/tmp/
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/f53b2f7d-ff5c-45be-a7a4-1a9552ebe57c)

```
[root@scriptbox remote_websetup]# scp -i ~/.ssh/id_rsa testfile.txt devops@web01:/home/devops
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/b9813c6b-4f5f-4346-959b-241ec9445fc1)

create a new sh file(webdeploy.sh)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/6940cee9-90b8-403a-928b-087ecde7a4ef)

make the file executable and run it.
```
[root@scriptbox remote_websetup]# chmod +x webdeploy.sh
[root@scriptbox remote_websetup]# ./webdeploy.sh
```


