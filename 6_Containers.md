## Docker

docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly.

For more info: https://docs.docker.com/get-started/overview/

![image](https://github.com/bengisugelin/DevOps/assets/113550043/3bcae202-0dd7-4e0d-87e4-105b9f5ea81f)


Here we see docker client, client can be on the same machine or it can be in a different machine. We will have it on the same machine for this particular application.

We will create a virtual machine, will install Docker engine in that VM and we will have a clients as well. with docker build command, we can build our own images. From the official images, we can pull image.


Let's dive into the hands-on practice:

as always, open gitbash and create a directory.


![image](https://github.com/bengisugelin/DevOps/assets/113550043/e6e3f59e-801d-4f8f-8988-6845141c4bfe)


in that directory, place Vagrantfile. Inside this vagrant file, we have some commands which will create or install docker engine.
All these commands are in the Docker Documentation.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/3ae093d6-3e67-48ba-a4eb-0749a1d4422e)

now, we will just bring this VM and install Docker engine.

```
bengi@LAPTOP-P7IJPPN9 MINGW64 /c/containerIntro
$ vagrant up
```

Now, VM is up, lets log into it and be the root user:
```
$ vagrant ssh
vagrant@ubuntu-focal:~$ sudo -i
root@ubuntu-focal:~#

```

lets check the server:
```
root@ubuntu-focal:~# systemctl status docker

```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/c16e0c5d-a935-4fa3-b4fa-315963aebd45)


As you see, docker engine is running. Let'sverify that Docker engine is installed correctly by running the hello-world image.

```
root@ubuntu-focal:~# docker run hello-world

```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/d77612f2-a125-4347-a03c-9b06c4f99e3d)


