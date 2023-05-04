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

**config.vm.network "private_network", ip: "192.168.25.12" ** -> If i uncomment this line , then i can have a static IP address. In double quotes, you can give an IP address you'd like to assign, Make sure it does not overlap with your network IP address

**config.vm.network "public_network"** -> this command line is going to fetch an IP address from a wireless router



# Create VM Automatically
# Vagrant Commands
# Vagrant Networking
# Provisioning
# RAM , CPU & DIis
# Multi VM Vagrantfile
# Documentation
