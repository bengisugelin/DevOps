EBS ( Elastic Block Storage)

EBS basically provides two things: EBS volume, the virtual hards disk and the snapshot.  

### EBS Types

- General Purpose(SSD)

  Most Work Loads
- Provisioned IOPS
  
  For Large databases 
- Throughput Optimized HD

  Big Data & Data Warehouses
- Cold HDD

  File Servers

- Magnetic

  Backups & Archives


for this session, we need a CentOS instance with a website running on it that we will provision from the following script:

```
#!/bin/bash
yum install httpd wget unzip -y
systemctl start httpd
systemctl enable httpd
cd /tmp
wget https://www.tooplate.com/zip-templates/2119_gymso_fitness.zip
unzip -o 2119_gymso_fitness.zip
cp -r 2119_gymso_fitness/* /var/www/html/
systemctl restart httpd
```

You can run the script from user data or you can launch the instance and then run the all commands one by one.
