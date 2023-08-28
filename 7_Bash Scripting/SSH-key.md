We dont always have to use to login to web01,web02 or web03 from scriptbox. We can create an SSH key and copy them to those server. how to do it? let's see:

```
[root@scriptbox ~]# ssh keugen
ssh: Could not resolve hostname keugen: Name or service not known
[root@scriptbox ~]# ssh keygen
ssh: Could not resolve hostname keygen: Name or service not known
[root@scriptbox ~]# ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:tJmdyj2A3bRlHWhosVCwo3hzXz0Uek54qtZ/DoRbED0 root@scriptbox
The key's randomart image is:
+---[RSA 2048]----+
|        oooo.oo  |
|         oo.o=Eo |
|        +.o.* *. |
|     . = O = @   |
|    . = S = + *  |
|     . + = + + . |
|        o * o .  |
|         . . . ..|
|              .o.|
+----[SHA256]-----+
```

now we should copy this key to others.:

```
ssh-copy-id devops@web01
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/acca5bae-01ac-449e-adf0-1dba153bba0d)

now, do the apply the same steps to the web02 and web03.

let's test it. 

this time, when i tried to login to web01, i will not ask password as it eill use the key.

```
[root@scriptbox ~]# ssh devops@web01 uptime
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/45af677a-f35d-493c-a695-172b306ff923)

