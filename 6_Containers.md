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

This one was only for test purposes. Let's discover more commands:

```
root@ubuntu-focal:~# docker images
```

This command will show you available images on your system.
![image](https://github.com/bengisugelin/DevOps/assets/113550043/fa813094-e617-415c-b5d4-ae6f9db01451)

```
root@ubuntu-focal:~# docker ps
```
docker ps will show you the running container. and docker ps -a will show you all the containers.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/35089905-cb63-49f0-ad6a-7618b30dedb1)


```
root@ubuntu-focal:~# docker run --name web01 -d  -p 9080:80 nginx
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/758f9484-7760-4e9c-a9ec-20ff113a9845)

```
root@ubuntu-focal:~# docker ps
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/c70fa220-4983-469b-ad74-e2f1417d5af8)


Now, i can access this container locally. for that, i need to know its IP address. 

```
root@ubuntu-focal:~# docker inspect web01
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/9463e993-83ae-4eee-81b7-130ee7a06010)

now we know that the IP address of the container 172.17.0.2

```
root@ubuntu-focal:~# curl http://172.17.0.2:80
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/313aecea-185c-4607-b229-6b2187491194)


It is in HTML format, but terminal cannot read it, just prints it. so, if you copy and check it from the browser, we can see a proper original page.

Let's look at the IP address of this VM.

```
ip addr show
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/f8cdfbc9-d3fe-45e3-a4df-ffb40dfacdb5)

our host port is 9080: 

```
docker ps
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/e304cd2e-a8b1-4381-b24d-2f79d93da744)


Let's take this ip and port number and go to the browser

![image](https://github.com/bengisugelin/DevOps/assets/113550043/8c7fe0cf-c3fc-4abc-be87-73d932045928)

This is coming straight from the container. So from the outside, the access is from the host port or the node port. and that routes to the container and gets us our data


Now, a quick overview of how to create our own image.


Let's create a directory called images

```
root@ubuntu-focal:~# mkdir images
```
inside it we will create a file called Dockerfile
```
root@ubuntu-focal:~/images# vim Dockerfile
```

and we are going to write some content here

![image](https://github.com/bengisugelin/DevOps/assets/113550043/354d8ea4-fa56-480f-baf5-cba708910e90)

let's just save this and run a command called a docker build -t

```
root@ubuntu-focal:~/images# docker build -t tesimg .
```
this might take a bit long time.

to see all the images
```
docker images
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/4a9ef5dc-b1b8-4c8b-875b-40b36e234dba)

this is basically a web application that we have downloaded from tooplate.com

now, lets run it:

```
root@ubuntu-focal:~/images# docker run -d -P tesimg
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/8b3765f2-d120-4ba0-92d7-87f6fd989d3d)

Lets access it from the browser:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/47cfb423-1bb5-4d2c-87c8-ba13fd24889e)

Now we are hosting this website in a container.



Let's do some clean up:
```
root@ubuntu-focal:~# docker ps
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/106b8144-c289-4b4f-8d55-7bf78d80a481)

```
root@ubuntu-focal:~# docker stop web01 frosty_mclaren
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/4fd9e4a1-a86b-4e74-a568-52a6425e0555)

```
root@ubuntu-focal:~# docker ps -a
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/ae7d5aad-636b-42f5-a0e8-03baab8de6ff)

```
root@ubuntu-focal:~# docker rm frosty_mclaren web01 exciting_faraday
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/22eab5db-6a6d-40d8-977d-2a1e8fcf3d57)

```
root@ubuntu-focal:~# docker images
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/640660ce-7045-4628-854b-ac5aefa87187)

```
root@ubuntu-focal:~# docker rmi 940e27aec548 eea7b3dcba7e 9c7a54a9a43c
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/30707a14-3edc-45a7-83c1-7fb7e256879a)


Everything is clean now, no images, no containers.
