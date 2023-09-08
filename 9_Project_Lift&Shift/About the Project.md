In previous project, we have a multi-tier Web application Stack[Vprofile] by using Vagrant. In this project, we are going to host and run it on AWS cloud for production. And we are going to use lift&shift strategy for this.

### Scenario

- Application Services running on Physical/Virtual machines
- Work load in our datacenter
- Virtualization team, DC OPS Tem, Monitoring team, System Admin team.

### Problem

  Managing all these services, server and teams is complex. It becomes more complex if you want to scale up or scale down, which needs to be done very regularly. there is a huge cost for procuring all these resources and also regular maintenance cost. And most of the process will be manual.

  If you have a virtualization layer on top of it, it is possible to automate those things, but it's difficult to do and maintain it. All these things are time consuming.

### Solution

solution to all these problems is to have a cloud computing setup, so instead of running our workload in our data center, if we run it on a cloud computing platform that we dont pay for the upfront cost for procuring the resource. We pay as we go. Consuming Infrastructure As Service (IAAS)

In this structure, we can do automation and automate each and every step and process to avoid human errors, as well as save time and cost.

### AWS Services used
  - EC2 instances will be our VMs for Tomcat, rabbitmq, memcache and mysql servers.
  - ELB (Elastic load balancer) a a replacement of our engine service
  - Autoscaling service which will automatically scale out and scale in our EC2 instances.
  - S3 / EFS Storage
  - Route 53 for a private DNS service

### Objective
  - Flexible infrastructure
  - no upfront cost
  - modernize effectively
  - IAAC ( Infrastructure as a code)
