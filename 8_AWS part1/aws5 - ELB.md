We are going to set up  a website from tooplate as we did previously on ec2 instance.
Sfter that we will create a Load Balancer for our ec2 instance.

Lets go to the EC2 service and launch an instance. As an AMI, we can select Amazon Linux or ubuntu, or centos. the script we will use can work on rpm based and debian based OS.

Amazon linux is an RPM based OS. we will keep it.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/c039cf11-cd6f-4071-ba55-737367a8f2b2)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/c217f061-51b0-4148-b741-f6d5b15c2dc7)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/665a5c3e-8440-4688-91f7-27ee7c46d364)

in advance details, paste this bash script:

```
#!/bin/bash

# Variable Declaration
#PACKAGE="httpd wget unzip"
#SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
   # Set Variables for CentOS
   PACKAGE="httpd wget unzip"
   SVC="httpd"

   echo "Running Setup on CentOS"
   # Installing Dependencies
   echo "########################################"
   echo "Installing packages."
   echo "########################################"
   sudo yum install $PACKAGE -y > /dev/null
   echo

   # Start & Enable Service
   echo "########################################"
   echo "Start & Enable HTTPD Service"
   echo "########################################"
   sudo systemctl start $SVC
   sudo systemctl enable $SVC
   echo

   # Creating Temp Directory
   echo "########################################"
   echo "Starting Artifact Deployment"
   echo "########################################"
   mkdir -p $TEMPDIR
   cd $TEMPDIR
   echo

   wget $URL > /dev/null
   unzip $ART_NAME.zip > /dev/null
   sudo cp -r $ART_NAME/* /var/www/html/
   echo

   # Bounce Service
   echo "########################################"
   echo "Restarting HTTPD service"
   echo "########################################"
   systemctl restart $SVC
   echo

   # Clean Up
   echo "########################################"
   echo "Removing Temporary Files"
   echo "########################################"
   rm -rf $TEMPDIR
   echo

   sudo systemctl status $SVC
   ls /var/www/html/

else
    # Set Variables for Ubuntu
   PACKAGE="apache2 wget unzip"
   SVC="apache2"

   echo "Running Setup on CentOS"
   # Installing Dependencies
   echo "########################################"
   echo "Installing packages."
   echo "########################################"
   sudo apt update
   sudo apt install $PACKAGE -y > /dev/null
   echo

   # Start & Enable Service
   echo "########################################"
   echo "Start & Enable HTTPD Service"
   echo "########################################"
   sudo systemctl start $SVC
   sudo systemctl enable $SVC
   echo

   # Creating Temp Directory
   echo "########################################"
   echo "Starting Artifact Deployment"
   echo "########################################"
   mkdir -p $TEMPDIR
   cd $TEMPDIR
   echo

   wget $URL > /dev/null
   unzip $ART_NAME.zip > /dev/null
   sudo cp -r $ART_NAME/* /var/www/html/
   echo

   # Bounce Service
   echo "########################################"
   echo "Restarting HTTPD service"
   echo "########################################"
   systemctl restart $SVC
   echo

   # Clean Up
   echo "########################################"
   echo "Removing Temporary Files"
   echo "########################################"
   rm -rf $TEMPDIR
   echo

   sudo systemctl status $SVC
   ls /var/www/html/
fi 
```


that is all, lets launch the instance.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/5f39d820-a595-4f6b-af40-c6f228ad2213)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/4d8d3d2f-9d48-41c2-934e-08fd55c41323)

now, copy the public id and paste to the browser to see the website:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/4a2895bb-6173-4bc5-a759-9fe50374edd3)


once that is done, we will do two more things before we go and create load balancer.

First thing is: **Create an AMI from this instance.**

To create AMI, select your instance and go to Actions -> Image and templates -> create image

![image](https://github.com/bengisugelin/DevOps/assets/113550043/a17b880f-35d8-4be6-a1fd-de9a695695fe)


![image](https://github.com/bengisugelin/DevOps/assets/113550043/acfc2865-f50b-444a-8d26-c42678f11466)

you can see the AMI inside the Images section.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/26df0a93-254c-4196-86af-e000ecb3b580)

now it is pending, after 3-5 minutes, it will be available.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/742e0643-fb2d-49d7-8ea0-293e772dab58)

Let's come to load balancer section:

We will go to target groups first. -> create target group

![image](https://github.com/bengisugelin/DevOps/assets/113550043/c5ad82b9-00ec-480d-b5cf-3d9787f589b1)

clcik include as pending below

![image](https://github.com/bengisugelin/DevOps/assets/113550043/2123a836-5a2b-4145-84a2-6391b5b6478a)

and create taarget group.

Now, go to the load balancer->create load balancer

![image](https://github.com/bengisugelin/DevOps/assets/113550043/f1b31997-ecb7-4ffa-9bdd-25e9ba1ab6f9)

we will go with application load balancer

![image](https://github.com/bengisugelin/DevOps/assets/113550043/44c2888b-32a8-4f8c-bc21-ffa7c7505c17)


select all the zones:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/9573fdfa-08ec-4948-88a6-6f46e84f3760)


next:security groups. we will create security group

![image](https://github.com/bengisugelin/DevOps/assets/113550043/0cbf8298-ed45-47d3-ab51-4153aa41be84)


![image](https://github.com/bengisugelin/DevOps/assets/113550043/bc9b9083-f10e-4686-8cb0-c82903012b85)


![image](https://github.com/bengisugelin/DevOps/assets/113550043/fa3d9d9f-78f4-45d0-bd2d-6b1579e2d49d)



wait fow a fet minutes for load balancer's state switched ti active

![image](https://github.com/bengisugelin/DevOps/assets/113550043/f24e98e7-e48a-4667-8585-1c068a300939)


![image](https://github.com/bengisugelin/DevOps/assets/113550043/f329332b-756f-4278-8584-9043fc3bf335)


we also need to add another inbound rulw to the security group so that we will be able to connect the website.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/66e63a01-1ccf-4617-82ba-22bd93ed8704)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/f96973b6-c981-4660-96d2-0867a6a2b8dd)

now copy the DNS and paste to the browser to reach the website

![image](https://github.com/bengisugelin/DevOps/assets/113550043/2ca408a7-1a9e-40a7-91cc-669c5fd3d781)
