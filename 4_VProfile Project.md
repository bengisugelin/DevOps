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
