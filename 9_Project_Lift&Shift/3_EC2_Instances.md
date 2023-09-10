Now we will going to launch EC2 instances for all services.  

we are going to start with mysql server  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/962a87c3-3dbc-4364-b9da-20f9a3f51bc6)  

Now, go to instances and say launch instance  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/c67074fc-620a-4c66-b95e-f8b665ac7fb4)  
we are going to use CentOs 9 for this one.  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/9f7e4290-4451-444f-b282-e08999b9f93d)  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/ddfc8822-ca30-4f89-89b9-6b24ce9f871e)  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/09bc950e-0cd6-42bf-8bfd-542461e2445e)  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/752d88ef-1999-42a7-a3e4-3941f07f90f8)  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/1dc2d056-f807-4672-8def-d0931b1e6f30)  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/5efbe52d-01bf-4f44-b2f5-ea3ad9444d82)  

we can launch this instance now.  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/4c6c26cd-d332-4f83-a9da-4228b40d6213)

While this one is launching, we can create other instances we need. Let's click launch instances again. This time we will launch memcache, vprofile-mc01
![image](https://github.com/bengisugelin/DevOps/assets/113550043/07e9fd21-3080-4a38-88f9-0eb4142aa829)  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/7252290e-72af-40cf-a081-6a03c617719c)  


Except Tomcat, everything will be CentOS 9.  

![image](https://github.com/bengisugelin/DevOps/assets/113550043/bf4a730f-462d-4f50-bdfb-8df13d1a5582)  

then click launch instances  

Now same thins for rabbit mq. 
- AMI: Centos 9
- advance details  
```
#!/bin/bash
sudo yum install epel-release -y
sudo yum update -y
sudo yum install wget -y
cd /tmp/
dnf -y install centos-release-rabbitmq-38
 dnf --enablerepo=centos-rabbitmq-38 -y install rabbitmq-server
 systemctl enable --now rabbitmq-server
 firewall-cmd --add-port=5672/tcp
 firewall-cmd --runtime-to-permanent
sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl status rabbitmq-server
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
sudo systemctl restart rabbitmq-server
 ```


 






