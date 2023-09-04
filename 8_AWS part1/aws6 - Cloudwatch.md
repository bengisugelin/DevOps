Cloud Watch: Monitor performance of AWS environment - standart infrastructure metrics


![image](https://github.com/bengisugelin/DevOps/assets/113550043/4e166011-a578-4bc1-b7a6-24251075f1fb)

These are some metics that Cloudwatch will create automatically when you launch an EC2 instance.


```
#STRESS Installation
# Centos
sudo yum install epel-release -y
sudo yum install stress -y

#Amazon Linux 2
sudo amazon-linux-extras install epel -y
sudo yum install stress -y

# Ubuntu
sudo apt update
sudo apt install stress -y

# stress command
stress -c 4 -t 60 && sleep 60 && stress -c 4 -t 60 && sleep 60 && stress -c 4 -t 360 && sleep  && stress -c 4 -t 460 && sleep 30 && stress -c 4 -t 360 && sleep 60
```
