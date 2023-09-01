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

We have a;ready created a key pair, and we will be just selecting it.

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
