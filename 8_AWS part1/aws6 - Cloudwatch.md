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

We can set uo an alarm using Cloudwatch.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/6df12747-6a77-4818-a324-a0b74596c1ee)

Come to all alarms section, click on create alarm, select metrics ans set your alarm.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/70221d61-701c-458e-aa0f-1582040e7844)
