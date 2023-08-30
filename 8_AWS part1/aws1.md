Let's begin Cloud computing. We will use AWS cloud computing.

And let's see what AWS has to say about cloud computing: On demand delivery of IT resources over the Internet with pay as you go pricing. So you don't need to procure hardware. You can access any computing power, storage or databases from cloud provider like. 

AWS is the biggest public cloud computing provider today.


## EC2 (Elastic Compute Cloud)

EC2 is one of the most popular service of AWS. This service is basically is about a virtual machines and the related services. EC2 basically provides web services for managing and provisioning virtual machines inside amazon cloud or Amazon's data center.

EC2 service is very famous for getting integrated with other services like S3, EFS, RDS, DynameDM and Lambda.

Let's talk about the components in th EC2 instance / service:
- primarily, we need an AMI, Amazon Machine Image. This is a ready made machine like vagrant we have seen vagrant boxes. Here we have AMI and we have a huge list to choose from.
- We have an instance type. This will be the size of our instance, the compute resource, how much amount of CPU, RAM, network speed or  storage speed.
- EBS (Elastic Block Store) This will be the storage. On AMI we primarily have a storage about 8GB for Liux  machine and 30 GB for windows machine. and then there are different size of AMI that will be using the EBS service
- we will have tah to every resource in AWS.
- We will have security group on every EC2 instance. This is basically a firewall for inbound and outbound traffic.
- To log in to an EC2 instance, we will need a key pair.


![image](https://github.com/bengisugelin/DevOps/assets/113550043/b56672dc-f8d7-44ae-ba6c-adf58adc2fe9)


Now, let's see how to launch an EC2 instance:

EC2 instance basically means a virtual machine, first we logged in our AWS console an select a region.
 We will select North Virgina region 
 
 ![image](https://github.com/bengisugelin/DevOps/assets/113550043/ac69f128-8607-4f49-a9a9-a41617f39389)

every region has code. For North Virginia, the code is "us-east-1"
