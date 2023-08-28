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
