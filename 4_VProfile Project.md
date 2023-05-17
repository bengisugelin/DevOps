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

```
bengi@LAPTOP MINGW64 /c/vprofile-project/vagrant/Manual_provisioning (local-setup)
$ vagrant ssh rmq01
[vagrant@rmq01 ~]$ sudo -i

[root@rmq01 ~]# yum update -y
```
All the package updates completed. Now, let's see the installation steps.
first, we need to install some dependencies. One of them is erlang and socat:
```
#sudo yum install wget -y
#cd /tmp/
#wget http://packages.erlang-solutions.com/erlang-solutions-2.0-1.noarch.rpm
#sudo rpm -Uvh erlang-solutions-2.0-1.noarch.rpm
#sudo yum -y install erlang socat
```
Now, let's install rabbitmq server:
```
#curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
#sudo yum install rabbitmq-server -y
```

It is installed! let's start and enable the service:
```
#sudo systemctl start rabbitmq-server
#sudo systemctl enable rabbitmq-server
```

let's check the status:
```
[root@rmq01 tmp]# sudo systemctl status rabbitmq-server
● rabbitmq-server.service - RabbitMQ broker
   Loaded: loaded (/usr/lib/systemd/system/rabbitmq-server.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2023-05-17 01:28:07 UTC; 28s ago
 Main PID: 17531 (beam.smp)
   CGroup: /system.slice/rabbitmq-server.service
           ├─17531 /usr/lib64/erlang/erts-12.3.2.1/bin/beam.smp -W w -MBas ageffcbf -MHas ageffcbf -MBlmbcs 512 -MHlmbcs 512 -MM...
           ├─17546 erl_child_setup 32768
           ├─17571 /usr/lib64/erlang/erts-12.3.2.1/bin/epmd -daemon
           ├─17594 inet_gethost 4
           └─17595 inet_gethost 4

May 17 01:28:06 rmq01 rabbitmq-server[17531]: Doc guides:  https://rabbitmq.com/documentation.html
May 17 01:28:06 rmq01 rabbitmq-server[17531]: Support:     https://rabbitmq.com/contact.html
May 17 01:28:06 rmq01 rabbitmq-server[17531]: Tutorials:   https://rabbitmq.com/getstarted.html
May 17 01:28:06 rmq01 rabbitmq-server[17531]: Monitoring:  https://rabbitmq.com/monitoring.html
May 17 01:28:06 rmq01 rabbitmq-server[17531]: Logs: /var/log/rabbitmq/rabbit@rmq01.log
May 17 01:28:06 rmq01 rabbitmq-server[17531]: /var/log/rabbitmq/rabbit@rmq01_upgrade.log
May 17 01:28:06 rmq01 rabbitmq-server[17531]: <stdout>
May 17 01:28:06 rmq01 rabbitmq-server[17531]: Config file(s): (none)
May 17 01:28:07 rmq01 rabbitmq-server[17531]: Starting broker... completed with 0 plugins.
May 17 01:28:07 rmq01 systemd[1]: Started RabbitMQ broker.
```

we have some congifuration changes in rabbitmq:
```
#sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
#sudo rabbitmqctl add_user test test
#sudo rabbitmqctl set_user_tags test administrator
```

After making these configuration changes, we can restart the server.
```
systemctl restart rabbitmq-server
```

if everything is good, when we restart, status will be active. If not, we will se some error.

```
[root@rmq01 tmp]# sudo systemctl status rabbitmq-server
● rabbitmq-server.service - RabbitMQ broker
   Loaded: loaded (/usr/lib/systemd/system/rabbitmq-server.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2023-05-17 01:31:52 UTC; 1min 7s ago
  Process: 17858 ExecStop=/usr/sbin/rabbitmqctl shutdown (code=exited, status=0/SUCCESS)
 Main PID: 17901 (beam.smp)
   CGroup: /system.slice/rabbitmq-server.service
           ├─17901 /usr/lib64/erlang/erts-12.3.2.1/bin/beam.smp -W w -MBas ageffcbf -MHas ageffcbf -MBlmbcs 512 -MHlmbcs 512 -MM...
           ├─17916 erl_child_setup 32768
           ├─17941 /usr/lib64/erlang/erts-12.3.2.1/bin/epmd -daemon
           ├─17964 inet_gethost 4
           └─17965 inet_gethost 4

May 17 01:31:52 rmq01 rabbitmq-server[17901]: Doc guides:  https://rabbitmq.com/documentation.html
May 17 01:31:52 rmq01 rabbitmq-server[17901]: Support:     https://rabbitmq.com/contact.html
May 17 01:31:52 rmq01 rabbitmq-server[17901]: Tutorials:   https://rabbitmq.com/getstarted.html
May 17 01:31:52 rmq01 rabbitmq-server[17901]: Monitoring:  https://rabbitmq.com/monitoring.html
May 17 01:31:52 rmq01 rabbitmq-server[17901]: Logs: /var/log/rabbitmq/rabbit@rmq01.log
May 17 01:31:52 rmq01 rabbitmq-server[17901]: /var/log/rabbitmq/rabbit@rmq01_upgrade.log
May 17 01:31:52 rmq01 rabbitmq-server[17901]: <stdout>
May 17 01:31:52 rmq01 rabbitmq-server[17901]: Config file(s): /etc/rabbitmq/rabbitmq.config
May 17 01:31:52 rmq01 systemd[1]: Started RabbitMQ broker.
May 17 01:31:52 rmq01 rabbitmq-server[17901]: Starting broker... completed with 0 plugins.
```

# App Setup

DB, memcache, rabbitmq is done. Now, we will log in to app01, where we are going to set up a tomcat service

```
bengi@LAPTOP MINGW64 /c/vprofile-project/vagrant/Manual_provisioning (local-setup)
$ vagrant ssh app01
Last login: Thu May 11 05:39:42 2023 from 10.0.2.2
[vagrant@app01 ~]$ sudo -i
[root@app01 ~]# yum update -y
[root@app01 ~]# yum install epel-release -y
```
Done. Now, dependency for tomcat-> jdk 1.8

```
[root@app01 ~]# yum install java-1.8.0-openjdk -y
[root@app01 ~]# yum install git maven wget -y
```
These tools are now installed, next, we will download Tomcat, so let's go to the /tmp directory.

```
[root@app01 ~]# cd /tmp

[root@app01 tmp]# wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz
--2023-05-17 04:11:31--  https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz
Resolving archive.apache.org (archive.apache.org)... 138.201.131.134, 2a01:4f8:172:2ec5::2
Connecting to archive.apache.org (archive.apache.org)|138.201.131.134|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 9653382 (9.2M) [application/x-gzip]
Saving to: ‘apache-tomcat-8.5.37.tar.gz.1’

100%[=========================================================================================>] 9,653,382   99.7KB/s   in 94s

2023-05-17 04:13:06 (99.9 KB/s) - ‘apache-tomcat-8.5.37.tar.gz.1’ saved [9653382/9653382]

[root@app01 tmp]# tar xzvf apache-tomcat-8.5.37.tar.gz

[root@app01 tmp]# useradd --home-dir /usr/local/tomcat8 --shell /sbin/nologin tomcat

[root@app01 tmp]# id tomcat
uid=1001(tomcat) gid=1001(tomcat) groups=1001(tomcat)
[root@app01 tmp]# ls /usr/local/tomcat8/
[root@app01 tmp]# cp -r apache-tomcat-8.5.37/* /usr/local/tomcat8/
[root@app01 tmp]# ls /usr/local/tomcat8/
bin  BUILDING.txt  conf  CONTRIBUTING.md  lib  LICENSE  logs  NOTICE  README.md  RELEASE-NOTES  RUNNING.txt  temp  webapps  work
[root@app01 tmp]#


[root@app01 tmp]# chown tomcat.tomcat /usr/local/tomcat8/ -R
[root@app01 tmp]# ls -l /usr/local/tomcat8/
total 124
drwxr-x---. 2 tomcat tomcat  4096 May 17 05:07 bin
-rw-r-----. 1 tomcat tomcat 19539 May 17 05:07 BUILDING.txt
drwx------. 2 tomcat tomcat   238 May 17 05:07 conf
-rw-r-----. 1 tomcat tomcat  6090 May 17 05:07 CONTRIBUTING.md
drwxr-x---. 2 tomcat tomcat  4096 May 17 05:07 lib
-rw-r-----. 1 tomcat tomcat 57092 May 17 05:07 LICENSE
drwxr-x---. 2 tomcat tomcat     6 May 17 05:07 logs
-rw-r-----. 1 tomcat tomcat  1726 May 17 05:07 NOTICE
-rw-r-----. 1 tomcat tomcat  3255 May 17 05:07 README.md
-rw-r-----. 1 tomcat tomcat  7142 May 17 05:07 RELEASE-NOTES
-rw-r-----. 1 tomcat tomcat 16262 May 17 05:07 RUNNING.txt
drwxr-x---. 2 tomcat tomcat    30 May 17 05:07 temp
drwxr-x---. 7 tomcat tomcat    81 May 17 05:07 webapps
drwxr-x---. 2 tomcat tomcat     6 May 17 05:07 work
```

Update file with following content.

vim /etc/systemd/system/tomcat.service
```
[Unit]
Description=Tomcat
After=network.target
[Service]
User=tomcat
WorkingDirectory=/usr/local/tomcat8
Environment=JRE_HOME=/usr/lib/jvm/jre
Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_HOME=/usr/local/tomcat8
Environment=CATALINE_BASE=/usr/local/tomcat8
ExecStart=/usr/local/tomcat8/bin/catalina.sh run
ExecStop=/usr/local/tomcat8/bin/shutdown.sh
SyslogIdentifier=tomcat-%i
[Install]
WantedBy=multi-user.target
```

Once you make any changes to tomcat.service file, you have to say systemctl
```
[root@app01 tmp]# systemctl daemon-reload
[root@app01 tmp]# systemctl enable tomcat
Created symlink from /etc/systemd/system/multi-user.target.wants/tomcat.service to /etc/systemd/system/tomcat.service.
[root@app01 tmp]# systemctl enable tomcat
```
Let's check the status now:
```
```
[root@app01 tmp]# systemctl status tomcat
● tomcat.service - Tomcat
   Loaded: loaded (/etc/systemd/system/tomcat.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2023-05-17 05:21:35 UTC; 15s ago
 Main PID: 19332 (java)
   CGroup: /system.slice/tomcat.service
           └─19332 /usr/lib/jvm/jre/bin/java -Djava.util.logging.config.file=/usr/...

May 17 05:21:35 app01 tomcat-[19332]: 17-May-2023 05:21:35.959 INFO [localhost-s...ms
May 17 05:21:35 app01 tomcat-[19332]: 17-May-2023 05:21:35.959 INFO [localhost-s...s]
May 17 05:21:36 app01 tomcat-[19332]: 17-May-2023 05:21:36.080 INFO [localhost-s...ms
May 17 05:21:36 app01 tomcat-[19332]: 17-May-2023 05:21:36.080 INFO [localhost-s...r]
May 17 05:21:36 app01 tomcat-[19332]: 17-May-2023 05:21:36.095 INFO [localhost-s...ms
May 17 05:21:36 app01 tomcat-[19332]: 17-May-2023 05:21:36.095 INFO [localhost-s...r]
May 17 05:21:36 app01 tomcat-[19332]: 17-May-2023 05:21:36.104 INFO [localhost-s...ms
May 17 05:21:36 app01 tomcat-[19332]: 17-May-2023 05:21:36.109 INFO [main] org.a..."]
May 17 05:21:36 app01 tomcat-[19332]: 17-May-2023 05:21:36.117 INFO [main] org.a..."]
May 17 05:21:36 app01 tomcat-[19332]: 17-May-2023 05:21:36.119 INFO [main] org.a...ms
Hint: Some lines were ellipsized, use -l to show in full.

```
