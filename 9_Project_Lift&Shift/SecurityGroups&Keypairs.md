So I am in my aws accoun, in North Virginia region.

I already have Certificate

![image](https://github.com/bengisugelin/DevOps/assets/113550043/aca2ddd6-0cba-46c8-addd-f38a48f0cc00)

I have a goDaddy domain and cname validation.  
The first thing we will do is creating security groups.  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/4bd561dd-9e23-4074-9c30-cc438c2b1bd7)  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/c72f28d7-8fe5-4d88-b77b-6367801dc2a2)  
Now lets create inbound rules  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/54fbd36e-6190-4f21-9326-39ccd699fee3)  
now we can click create  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/275befa3-8c1f-43dd-8dc1-11e35a298cc0)  

Next, we will create security group for our Tomcat instance.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/8c0a5dd2-7028-4379-b49d-023125bf48a8)  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/681c516c-66d5-403e-97c1-60322372ab99)  
And let's save and create this.

One more security group: this one will be for our backend services(Rabbitmq, memcache and mysql)  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/d9118d0b-890d-4c1f-a210-3324539ee7f6)  
inbound rules:  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/d2e2c88b-8740-47fa-9f1b-c351a085d69d)  
Let's create this one as well.

Now, we need to make one more change in our backend security group. In backend security group, we have three services and these services will also be interacting with each other. So we are going to give another rule:  
All traffic from bacand security group itself.  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/2e02525e-6269-44e7-937f-4a4e677f1172)  

these rules will make our application functional. But if we want to do SSH to the instances that we are going to launch, we need to add one more rule. 22 from myIP in both of the security groups. Let's go to the app security group first:  

![image](https://github.com/bengisugelin/DevOps/assets/113550043/6237e460-4ec4-4e56-8856-551da725f9fa)

save this rule. Let's go to the backend security group.  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/c0456c7f-8b02-4d9b-a211-b46f3707ae5c)  
save rules.  

In any case, if you make any mistake in adding the rule, we can always come back and make the changes.


Now, we will create login key pair. which we will use to log in to our EC2 instances. So go to key pairs, and click create key pairs.  
![image](https://github.com/bengisugelin/DevOps/assets/113550043/0888a7b0-f196-4a4b-b49a-def1a2cdda3c)  
We are going to use bash to log in, so will choose pem format. 
![image](https://github.com/bengisugelin/DevOps/assets/113550043/8cc6699f-b5ce-4e72-a989-c75fda9893e2)






 

