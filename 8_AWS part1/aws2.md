## Requirement Gathering

1 - OS (e.g. Centos)
  
2 - Size  ( e.g. RAM, CPU, Network etc.)

3 - Storage size  (e.g. 101 gigs)

4 - Project

5 - Services/Apps Running  (e.g. SSH, HTTP, MYSQL etc)

6 - Environment  (e.g. Dev, QA, Staging, Production)
    
7 - Login USer / Owner


First we will go to the key pairs under network & Security

![image](https://github.com/bengisugelin/DevOps/assets/113550043/48dd1c3d-e98a-40d4-8674-9522ca9cad94)

We will going to create a new key pair

![image](https://github.com/bengisugelin/DevOps/assets/113550043/46508723-844f-4ae4-8ace-dd37ed401b49)

so we will be setting up a website from tooplate.com

![image](https://github.com/bengisugelin/DevOps/assets/113550043/3a6060fc-9c36-45fc-ae50-459eb4df5efb)

I will go with Cafe Klang, but you can choose any of them. doesnt matter. So my project name will be klang, and this is for dev environment

![image](https://github.com/bengisugelin/DevOps/assets/113550043/32a71724-9b76-4487-9bde-8b515422ab81)


Let's go to the next part: Security Group. There is already one default security group. But we will create our own security group.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/740ecc69-f150-4768-8543-1eabb9aef5ba)

This is what I have done for now, but we will also add port 80 rules later.

Now, we can launch an instance. Click launch instance and give this tags:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/5f8efd53-2272-452b-8db3-1eb8e26337d6)


we will choose ubuntu this time.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/338bc843-624f-410c-aa93-7d9d83b5f3e7)

We have already created a key pair, and we will be just selecting it.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/e994d366-a2c2-416e-96bf-c74075856d64)


One key can be used for all the instances or each and every onstance can have their own keys. The best way is divide you key based on the environment. For dev environment one key, for Q&A one key, another key for production etc. Now lets create another key for production

![image](https://github.com/bengisugelin/DevOps/assets/113550043/0ad80ea6-834d-44a6-856d-259250ba1c9b)

so we can use the key for prod or dev.
![image](https://github.com/bengisugelin/DevOps/assets/113550043/a07838c3-38c3-42d1-9399-402f530fc6d9)

Now, edit the network settings by clicking the edit button. Slect the security group we created.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/ad8477e9-ab4b-47ec-bb49-65032227d747)

Now, Lets click launch instance!

![image](https://github.com/bengisugelin/DevOps/assets/113550043/590e5b26-14e9-4f51-b1e9-224bca2f2fa4)


![image](https://github.com/bengisugelin/DevOps/assets/113550043/afa627c8-8923-4690-8519-8c6ba6103b61)

Lets connect to it: We already knew how to so it: click connect button and get the info. give the path of the keypair, and voila!

![image](https://github.com/bengisugelin/DevOps/assets/113550043/37cbfd32-ac11-4ec2-9368-63923be88564)

Lets open gitbash

```
$ ssh -i kalg-prod-nvir.pem ubuntu@18.232.156.200
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/d0e6dbab-ec99-4a88-80de-a434000b43ac)

Logged in! Let's set up the website.

be the root user and run the command one by one.

```
ubuntu@ip-172-31-46-127:~$ sudo -i
root@ip-172-31-46-127:~# sudo apt install apache2 wget unzip -y
root@ip-172-31-46-127:~# wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
root@ip-172-31-46-127:~# unzip 2137_barista_cafe.zip
root@ip-172-31-46-127:~# cp -r 2137_barista_cafe/* /var/www/html/
root@ip-172-31-46-127:~# systemctl restart apache2
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/5e6ac3b3-5d8a-49b3-b7cf-536c739e8e11)


now, we know this service or this process, we will be accessing the website on port 80. So once again, lets copy the public IPv4 address of the instance. Since we did not set the security group, it will not work right now. We should go to the security group and make the changes so that it will allow prot 80.

so go to edit inbound rules add add port 80.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/a0aff1ab-c3d2-4435-8f2c-3e212823fb52)

Now we are ready. copy the public oip addres and paste to the web browser. HEre is our website:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/e170d6fc-16be-4184-8688-1d11aab6117e)

Let's do more..

Right now, the public IP off our website is 18.232.156.200. But if we power off the instance and power on again, the public IP will change.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/b04657c3-2a5b-43fa-9ac4-c9e0827b86a3)

If you say that you want a STATIC public IP, you dont want your public IP change even if you power off the instance, then you need to use elastic IP address.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/ef4b345c-f87d-4529-88ee-1cd2e83624fb)

Aclick Allocate Elastic IP Adress and click allocate.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/d130819b-6ae4-40c0-ae3f-886510b9eb96)

So now we have a static IP address for us. 
![image](https://github.com/bengisugelin/DevOps/assets/113550043/f85c2b37-0d56-484d-8a6f-2c236f9b0153)

Now we are going to associate this static IP to our instance.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/2d808deb-4a57-4dbe-bccb-40291f5a9e9d)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/712363bb-1715-49f1-b668-3c45bcd2389e)


![image](https://github.com/bengisugelin/DevOps/assets/113550043/00ae53ea-245b-40f4-b9e4-893b460e28af)


