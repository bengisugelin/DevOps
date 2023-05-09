This is a product called VProfile. It is a website written in Java, consist of Multiple Services. We will be deploying this product on five virtual machines. 
Like we have WordPress, where we have Apache and MySQL service running on the same VM, here we will have five services running running in five differen virtual machines.
In real time, we will be working in a product and we should have a local copy of that product where we can do your experiments.

# Introduction:

## About the Project
In this project, we will be setting a multi-tier web application stack. Set up will be locally on our laptop or desktop

## Scenario
LEt's say we're working in a project and in our project, we have varieties of services that we deal such as database services, MySQL, PostgreSQL, Web services, 
Apache Engine or application services any other 

We may also have RunBook or set up documents to set up our project stack

## Problem

You may not be comfortable in making changes in the real servers. You have the setuo document and runbook, still, you may not have the confidence in making changes in real systems. So, You can setup a local stack on your local machine probably by using virtual machines. We can do that, but local setup is complex, time consuming and, not repeatable. Therefore, it is better to avoid this setup.

## Solution
 What we can do is, we can have a local setup, but it would be automated and repeateble because we will have infrastructure as a code (IAAC)
 
 so if we have a code to set up the entire stack locally, we can do it as many as time, it is going to be repeatable, completely automated process. So we can do as much as R&D we want on our local machine. Let's see what are the tools that we need to set up this stack
 
 ## Tools
 1. Hypervisor (Oracle VM Virtualbox)
 2. Automation (vagrant)
 3. CLI - commands line interface (gitbash)
 4. IDE (sublime tex, notepad++, visual studio etc.)

## Objective
The purpose of this project:
- VM Automation locally
- baseline for upcoming projects
- real world project setup locally (for R & D)

## Architectural Design
Architecture of project services
- NGINX
- TOMCAT
- RABBITMQ
- MEMCACHE

Architecture of automated setuo
- vagrant
- virtualbox
- gitbash

We are going to set up a website, a web application, and this app is a social networking site written bt developers in Java language.

The word stack is used for collection of services working together to create an experience, in this case, a web app. So we need to set up all these services in our virtual machines and configure together so users get that experience of a web application.

So, user opens the browser or the app. in the browser, user will enter the URL, but in this project, we dont have a URL, we have an IP address. (in the next project we will set up a URL). This is the IP adress of a Load balancer and we are going to use NGINX service to create the load balancing experience.

NGINX is a webservice just like Apache httpd, and it is very commonly used to create load balancing. So, in one of our vm, we will be having NGINX service and we will configure it in a way as soon as the request comes, it is going to route the request to the Tomcat server.

Apache Tomcat is a Java Web application service. So if you have a web application written in Java, Tomcat is a very famous service to host it. If you application needs an external storage, you can user NFS servers. If you have cluster of servers and if you need a centralized storage, you can store it in NFS.

Here, there is also one more service called RabbitMQ connected to Tomcat. it is not functional for this project. the reaseon we have it is having a more coplex structure so that we can practice. RabbitMQ is a message broker or also called queuing agent to connect to applications together, you can stream the data from this.

Going back to our app, othe user will get a web page, will log in, the login details will be stored in MySQL database service. Our application will run an SQL query to access the user information stored in MySQL database. But before it goes to the MySQL database, the request will go to memcache service. Memcache is a database caching, it will be connected with the mySQL server. mySQL server will store the user information when the first time the request comes to the database MySQL, it will be sent from the MYSQL server to the Tomcat and then it will be cache to the Memcache service. So next time a request comes, it will be accessing the data which is cached in cache service just like you have browser cache, we also have database cache

Another desing we have is for automation stack. We will be using vagrant to automation. So vagrant will going to communicate with oracle CM, then we will be using some bach scripts to set up our services

Finally. let's understand the flow of execution.
1. set up all the tools 
2. clone the source code
3. cd into the vagrant directoru
4. bring up VMs
5. validate
6. setting us all the services
    - MySQL
    - Memcache
    - RabbitMQ
    - Tomcat
    - Nginx
    - app build & deploy
7. Verify from browser
 
