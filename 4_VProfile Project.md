This is a product called VProfile. It is a website written in Java, consist of Multiple Services. We will be deploying this product on five virtual machines. 
Like we have WordPress, where we have Apache and MySQL service running on the same VM, here we will have five services running running in five differen virtual machines.
In real time, we will be working in a product and we should have a local copy of that product where we can do your experiments.

# Introduction:

## About the Project
In this project, we will be setting a multi-tier web application stack. Set up will be locally on our laptop or desktop

## Scenario
LEt's say we're working in a project and in our project, we have varieties of services that we deal such as database services, MySQL, PostgreSQL, Web services, 
Apache Engine or application services any other 

We may also have RunBook or set up documents to set up our project stack

## Problem

You may not be comfortable in making changes in the real servers. You have the setuo document and runbook, still, you may not have the confidence in making changes in real systems. So, You can setup a local stack on your local machine probably by using virtual machines. We can do that, but local setup is complex, time consuming and, not repeatable. Therefore, it is better to avoid this setup.

## Solution
 What we can do is, we can have a local setup, but it would be automated and repeateble because we will have infrastructure as a code (IAAC)
 
 so if we have a code to set up the entire stack locally, we can do it as many as time, it is going to be repeatable, completely automated process. So we can do as much as R&D we want on our local machine. Let's see what are the tools that we need to set up this stack
 
 ## Tools
 1. Hypervisor (Oracle VM Virtualbox)
 2. Automation (vagrant)
 3. CLI - commands line interface (gitbash)
 4. IDE (sublime tex, notepad++, visual studio etc.)

## Objective
The purpose of this project:
- VM Automation locally
- baseline for upcoming projects
- real world project setup locally (for R & D)

## Architectural Design
Architecture of project services
- NGINX
- TOMCAT
- RABBITMQ
- MEMCACHE

Architecture of automated setuo
- vagrant
- virtualbox
- gitbash

We are going to set up a website, a web application, and this app is a social networking site written bt developers in Java language.

The word stack is used for collection of services working together to create an experience, in this case, a web app. So we need to set up all these services in our virtual machines and configure together so users get that experience of a web application.

So, user opens the browser or the app. in the browser, user will enter the URL, but in this project, we dont have a URL, we have an IP address. (in the next project we will set up a URL). This is the IP adress of a Load balancer and we are going to use NGINX service to create the load balancing experience.

NGINX is a webservice just like Apache httpd, and it is very commonly used to create load balancing. So, in one of our vm, we will be having NGINX service and we will configure it in a way as soon as the request comes, it is going to route the request to the Tomcat server.

Apache Tomcat is a Java Web application service. So if you have a web application written in Java, Tomcat is a very famous service to host it. If you application needs an external storage, you can user NFS servers. If you have cluster of servers and if you need a centralized storage, you can store it in NFS.

Here, there is also one more service called RabbitMQ connected to Tomcat. it is not functional for this project. the reaseon we have it is having a more coplex structure so that we can practice. RabbitMQ is a message broker or also called queuing agent to connect to applications together, you can stream the data from this.

Going back to our app, othe user will get a web page, will log in, the login details will be stored in MySQL database service. Our application will run an SQL query to access the user information stored in MySQL database. But before it goes to the MySQL database, the request will go to memcache service. Memcache is a database caching, it will be connected with the mySQL server. mySQL server will store the user information when the first time the request comes to the database MySQL, it will be sent from the MYSQL server to the Tomcat and then it will be cache to the Memcache service. So next time a request comes, it will be accessing the data which is cached in cache service just like you have browser cache, we also have database cache

Another desing we have is for automation stack. We will be using vagrant to automation. So vagrant will going to communicate with oracle CM, then we will be using some bach scripts to set up our services

Finally. let's understand the flow of execution.
1. set up all the tools 
2. clone the source code
3. cd into the vagrant directoru
4. bring up VMs
5. validate
6. setting us all the services
    - MySQL
    - Memcache
    - RabbitMQ
    - Tomcat
    - Nginx
    - app build & deploy
7. Verify from browser
 
# VM Setup

We will be using this repo:

https://github.com/devopshydclub/vprofile-project/tree/local-setup  

open the gitbash
```
bengi@LAPTOP MINGW64 ~
$ cd /c/

bengi@LAPTOP- MINGW64 /c
$ git clone https://github.com/devopshydclub/vprofile-project.git
Cloning into 'vprofile-project'...
remote: Enumerating objects: 2680, done.
remote: Counting objects: 100% (35/35), done.
remote: Compressing objects: 100% (26/26), done.
remote: Total 2680 (delta 13), reused 26 (delta 9), pack-reused 2645
Receiving objects: 100% (2680/2680), 75.72 MiB | 4.95 MiB/s, done.
Resolving deltas: 100% (977/977), done.
```

Now, I should see VProfile-project directory, that's my repository. cd into that.

```
bengi@LAPTOP MINGW64 /c
$ cd vprofile-project/

bengi@LAPTOP MINGW64 /c/vprofile-project (vp-rem)
$ git checkout local-setup
Switched to a new branch 'local-setup'
branch 'local-setup' set up to track 'origin/local-setup'.
$ ls
Jenkinsfile  README.md  ansible/  pom.xml  src/  vagrant/
$ cd vagrant/
$ ls
Automated_provisioning/  Automated_provisioning_MacOSM1/  Manual_provisioning/  Manual_provisioning_MacOSM1/
$ cd Manual_provisioning
$ ls
Vagrantfile  VprofileProjectSetup.pdf

```

This is the Vagrantfile we have here:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/9f4ef613-4d20-4eaa-94b3-7d82b1d6cefd)

```
bengi@LAPTOP MINGW64 /c/vprofile-project (local-setup)
$ cd vagrant/Manual_provisioning

bengi@LAPTOP MINGW64 /c/vprofile-project/vagrant/Manual_provisioning (local-setup)
$ vagrant up
$ vagrant ssh web01
vagrant@web01:~$  cat /etc/hosts
127.0.0.1       localhost

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost   ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
127.0.1.1       ubuntu-bionic   ubuntu-bionic

127.0.2.1 web01 web01

## vagrant-hostmanager-start
192.168.56.12   app01

192.168.56.15   db01

192.168.56.14   mc01

192.168.56.16   rmq01

192.168.56.11   web01

## vagrant-hostmanager-end
vagrant@web01:~$ logout

```
# DB, Cache & Queue Setup
Now its time to provisioning all these services:
1. Nginx (Web service)
2. Tomcat (Application service)
3. RabbitMQ (Broker/Queuing Agent)
4. Memcache (DB caching)
5. ElasticSearch ( Indexing/ Search service)
6. MySQL (SQL Database)

But we are going to provision them in this order: **MySQL -> Memcache -> RabbitMQ -> Tomcat -> Nginx**

First we will do it manually, then will automate the entire setup by using bash scripting. 

LEt's open the gitbash and login to db01
```
bengi@LAPTOP MINGW64 /c/vprofile-project/vagrant/Manual_provisioning (local-setup)
$ vagrant ssh db01
[vagrant@db01 ~]$ sudo -i
[root@db01 ~]# yum update -y
```
now we will run yum install epel-release, this will enable epel repositories, so we can install many more softwares.
```
[root@db01 ~]# yum install epel-release -y
```

Next, we will install git and mariadb, start and enable amriadb service.
```
[root@db01 ~]# yum install git mariadb-server -y
[root@db01 ~]# systemctl start mariadb
[root@db01 ~]# systemctl enable mariadb
Created symlink from /etc/systemd/system/multi-user.target.wants/mariadb.service to /usr/lib/systemd/system/mariadb.service.
```
Note: Mariadb server and MySQL server, both are same service with different package names.

```
[root@db01 ~]# mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none):
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

Set root password? [Y/n] y
New password:
Re-enter new password:
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] y
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
```
MAriadb service is secure now. We will log into the mariadb service or MySQL service by using MySQL client
```
[root@db01 ~]# mysql -u root -padmin123
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 5.5.68-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

We are in. Linux command wont work here. only SQL commands will work.

```
MariaDB [(none)]> create database account;
Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]> grant all privileges on accounts.* TO 'adin'@'%' identified by 'admin123' ;
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> FLUSH PRIVILEGES ;
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> exit;
Bye
```

We have created our db but now, wee need to feed it with some data. Let's clone the source code.

```
git clone -b local-setup https://github.com/devopshydclub/vprofile-project.git
```
if you do ls, you can see the vprofile-project cloned
```
[root@db01 ~]# ls
anaconda-ks.cfg  original-ks.cfg  vprofile-project
```
cd to it.
```
[root@db01 ~]# cd vprofile-project/
[root@db01 vprofile-project]# ls
ansible  Jenkinsfile  pom.xml  README.md  src  vagrant
[root@db01 vprofile-project]# ls src/main/resources/db_backup.sql
src/main/resources/db_backup.sql
[root@db01 vprofile-project]# mysql -u root -padmin123 account < src/main/resources/db_backup.sql

```
Now, let's login to the database
```
[root@db01 vprofile-project]# mysql -u root -padmin123 account
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 14
Server version: 5.5.68-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [account]> show tables;
+-------------------+
| Tables_in_account |
+-------------------+
| role              |
| user              |
| user_role         |
+-------------------+
3 rows in set (0.00 sec)

```
Now,you can resart mariadb if you'd like to. not necessary though.

```
systemctl restart mariadb
```
Logout from db01

**NExt, Memcache setup:**

Login to mc01: 
```
bengi@LAPTOP MINGW64 /c/vprofile-project/vagrant/Manual_provisioning (local-setup)
$ vagrant ssh mc01
```

switch to root user
```
[vagrant@mc01 ~]$ sudo -i
[root@mc01 ~]# yum update -y
[root@mc01 ~]# yum install epel-release -y
[root@mc01 ~]# yum install memcached -y
[root@mc01 ~]# systemctl start memcached
[root@mc01 ~]# systemctl enable memcached
Created symlink from /etc/systemd/system/multi-user.target.wants/memcached.service to /usr/lib/systemd/system/memcached.service.


[root@mc01 ~]# systemctl status memcached
● memcached.service - Memcached
   Loaded: loaded (/usr/lib/systemd/system/memcached.service; enabled; vendor preset: disabled)
   Active: active (running) since Thu 2023-05-11 20:42:05 UTC; 25s ago
 Main PID: 23271 (memcached)
   CGroup: /system.slice/memcached.service
           └─23271 /usr/bin/memcached -u memcached -p 11211 -m 64 -c 1024

May 11 20:42:05 mc01 systemd[1]: Started Memcached.
```

We need to run one more command for memcache so it can listen on TCP port (11211) and UDP port(11111)
```
[root@mc01 ~]# memcached -p 11211 -U 11111 -u memcached -d
```

We can validate if it is running on the right port:

```
[root@mc01 ~]# ss -tunlp | grep 11211
udp    UNCONN     0      0         *:11211                 *:*                   users:(("memcached",pid=23271,fd=28))
udp    UNCONN     0      0      [::]:11211              [::]:*                   users:(("memcached",pid=23271,fd=29))
tcp    LISTEN     0      128       *:11211                 *:*                   users:(("memcached",pid=23271,fd=26))
tcp    LISTEN     0      128    [::]:11211              [::]:*                   users:(("memcached",pid=23271,fd=27))
```

Memcahce is set up, let'ss log out from here and go to the next serrvice, which is the rabbitmq.
