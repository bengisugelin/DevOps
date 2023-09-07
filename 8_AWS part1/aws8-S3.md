
S3 is one of the most popular service of AWS and also the oldest one. One of the oldest one.

Let's see what is S3..So S3 is a storage service and you can access it over the Internet. You can store any amount of data in s3 bucket at any time, and you can access it from anywhere.

the data that you store is object and the storage is called bucket. The bucket name has to be unique. it is a logical unit of storage on AWS. 

Amazon S3->Bucket -> Folder ->Object -> public access


S3 Storage Classes:

1. **S3 Standard** : General purpose storage of frequently accessed data. Fast access & object replication in multi AZ.
2. **S3 IA-Infrequent Access** : Long-lived, but less frequently accessed data. Slow accsess, object replication in multi AZ
3. **S3 One Zone - IA** : is for data that is accessed less frequently, but requires rapid access when needed. Slow access, no object replication.
4. **S3 Intelligent Tiering** : Automatically moves data to most cost effective tier.
5. **S3 Galcier** : low cost storage class for data archiving.
6. **S3 Glacier Deep Archive** : Lowest cost storage, retrieval time of 12 hours.


Lifecycle policies: storage can be changes according to the age. for instance, if the data is only for 30 days it will be S3standard, after 30 days, will be S3 IA-infrequent Access and after 90 days, will be S3 glacier.


lets go to the S3:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/07581864-1394-468e-b8e8-1dcfaed11663)


click create bucket. the bucket name should be unique.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/58fdbe94-79af-466c-a564-044f56cba71a)

and create your bucket.

After creating it, you can see objects, properties, permissions, meti=rics, management and access points.

go to object, click on upload, click dd files, then we can browse our destop and choose the file we want, choose them and click add file.

By default, the storage class will be standar, but you can choose anything you want.





