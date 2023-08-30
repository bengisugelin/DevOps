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

every region has code. For North Virginia, the code is "us-east-1".

LEt's write EC@ to search bar and find the EC2. Now, we are at the EC2 dashboard.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/e6d8d16f-3479-4de4-959e-272730b1a478)

Here you can see how many instances is running at the moment, how mant instances you have in total etc. 

Let's click on Instances located on the left bar:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/a39a3291-78c6-4970-a632-a3eda0a91cf9)

and click Launch instances.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/3b57a3ac-f3b5-4c84-a710-e794955f7ef9)

Give a name to the instance as web01. We will also add name tags ( Project alpha)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/2fdad01e-379c-44e7-8477-6df204a89471)


now we will select AMI ( Amazon MAchine Image)
![image](https://github.com/bengisugelin/DevOps/assets/113550043/9e806ef5-061a-49d3-8ece-669721465cb0)

search for centos and select CetOs Stream 9 (x86_64)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/1d320128-30e3-46fc-9963-e8dc09e84403)

In Default,  instance tyoe is t3.small. (it is nor free), We will change it to t2.micro, which freely available.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/cfac8aa8-2e3a-4815-bd00-b925fe476bf7)

For every specific purpose, wwe can select different instance type. For instance, if youre looking for Compute optimized, then C series would be better, if youre looking for memory optimized then R series recommended etc.

So based on what application you are going to host in your EC2 instance, you need to select the right instance. 


Click create new keypair

![image](https://github.com/bengisugelin/DevOps/assets/113550043/ac8b8e91-282d-43fb-841d-8122f87fc19a)


![image](https://github.com/bengisugelin/DevOps/assets/113550043/81ba6272-a4c6-41ea-9620-56793d65565b)



Now, let's create a firewall rule on that. Every EC2 instance will have a mandatory firewall that is called as security group

![image](https://github.com/bengisugelin/DevOps/assets/113550043/533582e9-0faf-4791-ab94-b36fced2b58c)

we will add more rules later.

Now, click on advanced details. go to the end of it, where you will see user data. This section is like vagrant provisioning. We will mention the commands and when the instance comes up, it will execute those commands.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/902f3ed9-85fa-49c0-b43c-6d111de21aa7)


And that is all. Click lauch instance

![image](https://github.com/bengisugelin/DevOps/assets/113550043/b40ab58a-d7b3-4101-8aac-397f1e8ae254)

click view all instances to see all.

it will take some time to see the instance.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/fc094f3c-2119-41ac-bcb5-c5b9dd2de076)

The instance has a public ID which we can use to acess it from the internet, and it has a private IP which is for internal communication.

So, How do i connect ?  There is a connect button, clcik on that. We will be using ssh client. It will tell you how to connect.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/78539516-37d7-4bee-9f9a-a11a7cf87b0f)


