# Intro to Vagrant

```
$ cd /c/vagrant-vms/ubuntu18/
$ vagrant global-status
id       name    provider   state    directory
-------------------------------------------------------------------------
7d71c6b  default virtualbox poweroff C:/vagrant-vms/centos7
088c744  default virtualbox poweroff C:/vagrant-vms/ubuntu18

The above shows information about all known Vagrant environments
on this machine. This data is cached and may not be completely
up-to-date (use "vagrant global-status --prune" to prune invalid
entries). To interact with any of the machines, you can go to that
directory and run Vagrant, or you can use the ID directly with
Vagrant commands from any directory. For example:
"vagrant destroy 1a2b3c4d"
```

So right now, we have two virtual machines running with vagrant
```
$ vagrant status
Current machine states:

default                   poweroff (virtualbox)

The VM is powered off. To restart the VM, simply run `vagrant up`

```
in ubuntu, if you create a file beginning with a dot, this file will be hidden file. to see it:
```
$ ls -a
./  ../  .vagrant/  Vagrantfile  ubuntu-bionic-18.04-cloudimg-console.log
```
If you want to make any change to the VM, you can open the Vagrantfile above. 

In the Vagrant file:


**config.vm.network "private_network", ip: "192.168.25.12"** -> If i uncomment this line , then i can have a static IP address. In double quotes, you can give an IP address you'd like to assign, Make sure it does not overlap with your network IP address

**config.vm.network "public_network"** -> this command line is going to fetch an IP address from a wireless router. So it will be dynamic

We can also change the RAM size. If you want to increase or decrease it, you can do it by uncommenting  vb.memory and relation sections:

```
config.vm.provider "virtualbox" do |vb| -> **uncommented**
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "1600" -> **uncommented**
     vb.cpus = 2 
  end -> **uncommented**
```
If you are good with all the settings, save it. You can go back to the git bash and verify the changes using cat command.

```
vagrant@ubuntu-bionic:~$ free -m
              total        used        free      shared  buff/cache   available
Mem:           1550          88         924           0         537        1316
Swap:             0           0           0
vagrant@ubuntu-bionic:~$ ifconfig
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::40:49ff:feac:f020  prefixlen 64  scopeid 0x20<link>
        ether 02:40:49:ac:f0:20  txqueuelen 1000  (Ethernet)
        RX packets 6646  bytes 8323994 (8.3 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1105  bytes 143454 (143.4 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp0s8: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.25.12  netmask 255.255.255.0  broadcast 192.168.25.255
        inet6 fe80::a00:27ff:fe84:a4dd  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:84:a4:dd  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 13  bytes 1046 (1.0 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp0s9: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.70  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 2001:569:7697:3100:a00:27ff:fe27:78e0  prefixlen 64  scopeid 0x0<global>
        inet6 fe80::a00:27ff:fe27:78e0  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:27:78:e0  txqueuelen 1000  (Ethernet)
        RX packets 35  bytes 4440 (4.4 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 42  bytes 4682 (4.6 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 12  bytes 1258 (1.2 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 12  bytes 1258 (1.2 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

```
## Vagrant sync directory
Let's see what files we have in ubuntu directory:
```
/c/vagrant-vms/ubuntu18
$ ls
Vagrantfile  ubuntu-bionic-18.04-cloudimg-console.log
```

Let's create another file:
```
bengi@LAPTOP MINGW64 /c/vagrant-vms/ubuntu18
$ touch testfile123.txt

bengi@LAPTOP MINGW64 /c/vagrant-vms/ubuntu18
$ ls
Vagrantfile  testfile123.txt  ubuntu-bionic-18.04-cloudimg-console.log
```

And a directory:
```
bengi@LAPTOP MINGW64 /c/vagrant-vms/ubuntu18
$ mkdir devopsdir

bengi@LAPTOP MINGW64 /c/vagrant-vms/ubuntu18
$ ls
Vagrantfile  devopsdir/  testfile123.txt  ubuntu-bionic-18.04-cloudimg-console.log
```
When you create VM with vagrant, it will sync the vagrant directory where you have the vagrantfile, in this case, /c/vagrant-vms/ubuntu18 directory. and this directory corresponds /vagrant directory in the vm. So, When we logged in to the VM, if we go to cd /vagrant, we will see the same files&directories we have created in /c/vagrant-vms/ubuntu18 directory.

```
vagrant@ubuntu-bionic:~$ cd /vagrant/
vagrant@ubuntu-bionic:/vagrant$ ls
Vagrantfile  devopsdir  testfile123.txt  ubuntu-bionic-18.04-cloudimg-console.log
```
The beauty of it, you can reach this file from your computer. you dont need specifically go to the vagrant and open it with vim for instance.

If you want to wwrite some code using some IDE like visual studio or pycharm, you can open your file through one of these IDEs and write your code without connecting the VM. After writing the script, you can use it in the VM.

So, i am creating files in the vagrant, inside the devopsdir directory:
```
vagrant@ubuntu-bionic:/vagrant$ cd devopsdir/
vagrant@ubuntu-bionic:/vagrant/devopsdir$ ls
vagrant@ubuntu-bionic:/vagrant/devopsdir$ touch devopsscripts{1..10}.sh
```

Now, i can see these files from my computer, C:\vagrant-vms\ubuntu18\devopsdir.

![image](https://user-images.githubusercontent.com/113550043/236296194-3ecaaee3-a832-437e-b834-e7e888c63ef2.png)


I can open one of these bash files using IDE, and start typing:


![image](https://user-images.githubusercontent.com/113550043/236295970-d4ea48ad-2dab-45c9-9c7d-c8494d4c593f.png)


Let's execute the file:
```
vagrant@ubuntu-bionic:/vagrant$ /vagrant/devopsdir/devopsscripts1.sh
Welcome to bash scripting.
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Get:3 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:4 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [83.3 kB]
Fetched 261 kB in 1s (177 kB/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done
15 packages can be upgraded. Run 'apt list --upgradable' to see them.
Completed succesfully.
vagrant@ubuntu-bionic:/vagrant$
```

**Note** : if you are using graphical editor from Windows such as notepad and executing it in linux, you may get an error. In this case, you should change the format of the file from Windows to unix (usually located in the righet down corner of the IDE).

![image](https://user-images.githubusercontent.com/113550043/236298089-46a77a2c-28b3-43c7-b949-33d5dbe93795.png)

That was about using a default sync, dir, /vagrant BUT if you want to create your own sync directory, you can do that as well. For that purpose, we need to edit the vagrant file.

![image](https://user-images.githubusercontent.com/113550043/236299043-c13a2ad0-8ad4-4c86-8907-462df87f05f5.png)
We need to uncomment line 46, here, "../data" is the host machine dir path, your computer. and "/vagrant_data" is the VM directory path. VM directory will be created automatically, but the host machine, we have to create it. 

LEt's say you have some data in your host machine, or if you want to preserve the data from hte VM in the host machine, in your laptop, create a directory (vagrant_myshellscripts)

![image](https://user-images.githubusercontent.com/113550043/236300219-17462e2f-6c41-4b5f-91c8-535b6d91a0b3.png)

and copy the files inside the devopsdir directory we have created. ( or whatever data you want to put)

![image](https://user-images.githubusercontent.com/113550043/236300432-c45fb6c7-1cb9-4e43-b867-ee3c153f2cf4.png)

Now, we need to change the path in our Vagrantfile:

![image](https://user-images.githubusercontent.com/113550043/236301583-337f9912-bcc7-4fd0-aa2f-2c545da382ff.png)

When you're okay with the configurations, you can save the file, and go to the vagrant vm. to apply the changes:
```
$ vagrant reload
```
![image](https://user-images.githubusercontent.com/113550043/236304094-f71a658d-6282-4702-930e-400296d85850.png)

If you read the output here, you cn see the vagrant is a default sync directory, and we can also see the directory we have created  below it.

Let's log in to the VM and get in to our directory:
```
vagrant@ubuntu-bionic:~$ cd /opt/scripts/
vagrant@ubuntu-bionic:/opt/scripts$ ls
devopsscripts1.sh
```

Whatever directory or file I put in here will be preservse in my laptop. If the machine is deleted or it gets corrupted, I dont need to worry about losing my data and plus, I can use an IDE while coding.

# Provisioning
Provisioning in vagrant means executing your commands or scripts ehen your VM comes up. In some other texhnologies, these things are also called as a bootstrapping. That means, when the operating system is booting, we execute some commands, some scripts. So if you're bringing up VM to configure something, so you bring the VM by making changes to vagrant file, you bring up your VM and then you log in, then execute your commands.

Instead of that, you can put all those commands in this section, in the provisioning section

![image](https://user-images.githubusercontent.com/113550043/236555267-7e0d5208-87e1-4736-835f-df398691fb6c.png)

And Vagrant will execute for you

Let's try it with CentOS, you can do the same in Ubuntu VM as well:

```

bengi@LAPTOP MINGW64 /c/vagrant-vms/centos7
$ vagrant destroy
    default: Are you sure you want to destroy the 'default' VM? [y/N] y
==> default: Destroying VM and associated drives...

```
We remoe the centOS VM as you can see 

![image](https://user-images.githubusercontent.com/113550043/236560579-87e46505-d049-4256-977f-666a5801456b.png)

Now, I am going to edit the vagrantfile for the CentOS7 VM, 
```
bengi@LAPTOP-P7IJPPN9 MINGW64 /c/vagrant-vms/centos7
$ ls
Vagrantfile
```
Let's ope the Vagrantfile in Notepad++,  uncomment provision part:

![image](https://user-images.githubusercontent.com/113550043/236561192-6c753a17-9893-49af-9fa6-735120429122.png)

Here after config.vm.provision, it sys shell. There are other different provisioners like puppet or chef (we will see them later)
commands between SHELL will be executed. so, let's write some scripts there.

apt-get commands are for ubuntu, we are working in CentOS now, so we need to change these commands.


![image](https://user-images.githubusercontent.com/113550043/236567956-fa76b2ec-5f91-4fa5-bd56-d17353a6913d.png)


Let's save this and go to the gitbash. Right now, VM is not created. I does not exist, and i just need to do "vagrant up"

![image](https://user-images.githubusercontent.com/113550043/236568376-b323670a-2900-4cfa-bb27-fc8cb0095b7a.png)

VM will be created and commands provided between SHELL will be executed. Here, provision completed succesfully.

So, this example was for when the VM does not exist. But what if VM has already been exist like ubuntu we have? Let's do some provisioning for that one as well. 
- Open the vangrant file of ubuntu
- uncomment the provisioning part of the file
![image](https://user-images.githubusercontent.com/113550043/236571754-b7aed2ff-93a2-427b-a48f-000f39fb1c09.png)

save the file and go back to gitbash

```
bengi@LAPTOP MINGW64 /c/vagrant-vms/ubuntu18
$ tail Vagrantfile
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
   config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y apache2
   SHELL
end

```
When you want to apply the changes to an existing VM, run vagrant reload --provision command. If you dont give --provision, then it will not execute your provisioning part because mostly provisioning is for bootstrapping when it comes a first time. IF everytime you reboot and everytime it's executing your commands, then it can give you some weird issues
```
bengi@LAPTOP-P7IJPPN9 MINGW64 /c/vagrant-vms/ubuntu18
$ vagrant reload --provision
```
After reload, we can log in by typing "vagrant ssh"

```
Last login: Thu May  4 19:07:45 2023 from 10.0.2.2
vagrant@ubuntu-bionic:~$ sudo systemctl status apache2
● apache2.service - The Apache HTTP Server
   Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
  Drop-In: /lib/systemd/system/apache2.service.d
           └─apache2-systemd.conf
   Active: active (running) since Fri 2023-05-05 21:32:37 UTC; 1min 51s ago
 Main PID: 2862 (apache2)
    Tasks: 55 (limit: 1829)
   CGroup: /system.slice/apache2.service
           ├─2862 /usr/sbin/apache2 -k start
           ├─2864 /usr/sbin/apache2 -k start
           └─2865 /usr/sbin/apache2 -k start

May 05 21:32:37 ubuntu-bionic systemd[1]: Starting The Apache HTTP Server...
May 05 21:32:37 ubuntu-bionic apachectl[2837]: AH00558: apache2: Could not reliably determine the serve
May 05 21:32:37 ubuntu-bionic systemd[1]: Started The Apache HTTP Server.
```
Here you can see that apache2 is running, Apache2 is a web service, it will be serving web pages, we can access from the web browser. LEt's take the static IP or bridge IP ( whatever you want) then go to our browser.

![image](https://user-images.githubusercontent.com/113550043/236595672-92af871b-da8a-453d-a50f-dd898cd0ea26.png)


![image](https://user-images.githubusercontent.com/113550043/236595747-357eefc4-fba6-4e89-a0ee-71aa98ed7751.png)

# Website Setup
first, setting up a website on CentOS7, we will take a ready-made website available from tooplate.com, tehre are so many oother sites that you can get a template. [https://www.tooplate.com/]

I am going to downlaod this template: https://www.tooplate.com/view/2121-wave-cafe . But you can downlaod any of those templates by clicking download button. After downloading the template, let's go to the shell. and create a new directory.
```
bengi@LAPTOP-P7IJPPN9 MINGW64 /c/vagrant-vms
$ mkdir wavecafe/

bengi@LAPTOP-P7IJPPN9 MINGW64 /c/vagrant-vms
$ cd wavecafe/
```

now, got to the vagrant cloud website [https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=&q=centos+7] and search for centos7
![image](https://user-images.githubusercontent.com/113550043/236596634-521a328e-6276-40e0-a01d-e2d5f1bf8454.png)

choose geerlingguy and copy the highlighted part: 
![image](https://user-images.githubusercontent.com/113550043/236596678-e4bfc675-9904-4b2f-b362-7fea1239f7e8.png)

noe, go back to the git bash and enter "vagrant init geerlingguy/centos7" command:
```
bengi@LAPTOP MINGW64 /c/vagrant-vms/wavecafe
$ vagrant init geerlingguy/centos7
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
```
This will create a vagrant file and we will edit it through vim editor.
```
vim Vagrantfile
```
firstly, we need an IP address to access our website, so uncomment these parts:
![image](https://user-images.githubusercontent.com/113550043/236597098-4e285a20-760b-4dd8-b032-2e2132984987.png)

Let's bring up our VM, log in to it and become a root user:
```
bengi@LAPTOP MINGW64 /c/vagrant-vms/wavecafe
$ vagrant up
$ vagrant ssh
[vagrant@localhost ~]$ sudo -i
[root@localhost ~]#
```
install the httpd:
```
[root@localhost ~]# yum install httpd wget unzip -y
```
After installation, start our service and also enable it so that it can be activated in the boot time
```
[root@localhost ~]# systemctl start httpd
[root@localhost ~]# systemctl enable httpd
Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.
```

Now using your static IP or IP that you got from your wifi router, you can go to the browser and you can see the default apache page like in ubuntu

![image](https://user-images.githubusercontent.com/113550043/236643597-37e6db86-fb6d-4877-a48e-42a19edc4abb.png)

Let's go back to the git bash.

Server data is located in /var directory -> /var/www/html -> this is the directory where you can put your html templates, your html files and it is going to serve those html pages when you access from the browser. the first file by default is index.html for apache httpd service.
```
[root@localhost ~]# cd /var/www/html
[root@localhost html]# vi index.html  ( you can write whatever you want eg. this is a sample website.)
[root@localhost html]# systemctl restart httpd

```
It is not mandatory for index.html to restart your service, but if you have so manty linked file, then you need to restart. in any case, when we make configuration changes to the server, we need to restart or reload the changes. Now, lets go back to the browser and refresh the page

![image](https://user-images.githubusercontent.com/113550043/236644090-7e94c0fe-9d10-4f23-9d1c-ab34b980e032.png)

This is the index.html file we created. not the default one. But we need the website from tooplate that we downloaded. It is in our local machine rigth now, but we need to download it in the Linux VM. so we will use wget command. first wee need a download link for this purpose. to find the link:
- go to the Wave cafe template page
- inspect the page ( make sure you are in the network tab)
- this is how developers debug their website generally, clik download button. You dont really download the file, you can cancel it, Our purpose here is getting the link.
- when you clicked the zip file, you can see the link on the right side. copy it.
![image](https://user-images.githubusercontent.com/113550043/236644782-62fd308f-eadb-42e7-b0e4-2447f7d7eb00.png)

Now, we can download it:
```
[root@localhost html]# cd /tmp
[root@localhost tmp]# wget https://www.tooplate.com/zip-templates/2121_wave_cafe.zip
--2023-05-06 20:14:15--  https://www.tooplate.com/zip-templates/2121_wave_cafe.zip
Resolving www.tooplate.com (www.tooplate.com)... 69.16.201.107
Connecting to www.tooplate.com (www.tooplate.com)|69.16.201.107|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 11896390 (11M) [application/zip]
Saving to: ‘2121_wave_cafe.zip’

100%[======================================>] 11,896,390  9.88MB/s   in 1.1s

2023-05-06 20:14:17 (9.88 MB/s) - ‘2121_wave_cafe.zip’ saved [11896390/11896390]

[root@localhost tmp]# ls
2121_wave_cafe.zip
systemd-private-357225ec54464761a2f52c389d7773fa-chronyd.service-HEgRCH
systemd-private-357225ec54464761a2f52c389d7773fa-httpd.service-AYvKh1
systemd-private-ff862164549c4ff797a8dc5ad7c941b9-chronyd.service-oI55Sl
```

unzip it:
```
[root@localhost tmp]# unzip 2121_wave_cafe.zip
[root@localhost tmp]# ls
2121_wave_cafe
2121_wave_cafe.zip
systemd-private-357225ec54464761a2f52c389d7773fa-chronyd.service-HEgRCH
systemd-private-357225ec54464761a2f52c389d7773fa-httpd.service-AYvKh1
systemd-private-ff862164549c4ff797a8dc5ad7c941b9-chronyd.service-oI55Sl
[root@localhost tmp]# cd 2121_wave_cafe
[root@localhost 2121_wave_cafe]# ls
css  fontawesome  img  index.html  js  video
```
after unzipping the file, we can now see the website data, including index.html file.

now, copy all this content to the /var/www/html directory

```
[root@localhost 2121_wave_cafe]# cp -r * /var/www/html
cp: overwrite ‘/var/www/html/index.html’? y
```
It's time to restart our service:
```
[root@localhost 2121_wave_cafe]# systemctl restart httpd
[root@localhost 2121_wave_cafe]# ls /var/www/html
css  fontawesome  img  index.html  js  video
```

check if the service is running or not:
```
[root@localhost 2121_wave_cafe]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Active: active (running) since Sat 2023-05-06 20:19:41 UTC; 1min 37s ago
     Docs: man:httpd(8)
           man:apachectl(8)
  Process: 3157 ExecStop=/bin/kill -WINCH ${MAINPID} (code=exited, status=0/SUCCESS)
 Main PID: 3162 (httpd)
   Status: "Total requests: 0; Current requests/sec: 0; Current traffic:   0 B/sec"
   CGroup: /system.slice/httpd.service
           ├─3162 /usr/sbin/httpd -DFOREGROUND
           ├─3163 /usr/sbin/httpd -DFOREGROUND
           ├─3164 /usr/sbin/httpd -DFOREGROUND
           ├─3165 /usr/sbin/httpd -DFOREGROUND
           ├─3166 /usr/sbin/httpd -DFOREGROUND
           └─3167 /usr/sbin/httpd -DFOREGROUND

May 06 20:19:41 localhost.localdomain systemd[1]: Stopped The Apache HTTP Server.
May 06 20:19:41 localhost.localdomain systemd[1]: Starting The Apache HTTP Server...
May 06 20:19:41 localhost.localdomain httpd[3162]: AH00558: httpd: Could not reliably determine the server's full...sage
May 06 20:19:41 localhost.localdomain systemd[1]: Started The Apache HTTP Server.
Hint: Some lines were ellipsized, use -l to show in full.
```

Yes, it is running. Let's test it in our browser. resfresh your browser and see the result.

![image](https://user-images.githubusercontent.com/113550043/236645218-4f74e473-4600-420d-a41f-245d87a6cea6.png)

Yay! we are hosting a website!

# Create VM Automatically. 
# Vagrant Commands
# Vagrant Networking

# RAM , CPU & DIis
# Multi VM Vagrantfile
# Documentation
