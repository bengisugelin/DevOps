# Tools needed to be installed
 ## Oracle vm virtualbox
 - To install it through powershell or command prompt:
 ```
  choco install virtualbox --version=6.1.40 
 ```
 (you can search for the latest version)
 - To install it on Ubuntu
 ```
  sudo apt update
  sudo apt install virtualbox
  ```
 ## GIT Bash
  - To install it through powershell or command prompt:
  ```
   choco install git
  ```
  - To install it on Ubuntu
  ```
   apt install git
   ```
 ## Vagrant
  - To install it through powershell or command prompt:
  ```
   choco install vagrant
  ```
   - To install it on Ubuntu
   ```
    curl -O https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb |  sudo apt install ./vagrant_2.2.9_x86_64.deb
   ```
 ## Chocolatey(windows) / Brew (MacOS)
 - Chocolatey is a tool in Windows to install softwares through command line like
 ```
  choco install notepad++ 
 ```
 - This is not a mandatory tool. You can just search for software on the internet, download & install it. 
 - open Powershell or command prompt and run the command and install the software
 - To install chocolatey go to their website through this link [https://chocolatey.org/install] and follow the steps.
 - You have to run powershell as an administrator. After installed it, you can search for any software in the website [https://community.chocolatey.org/packages], find the command and run it on you computer to install that software.
 ```
  eg. choco intall virtualbox
 ```
 ## JDK8
  - To install it through powershell or command prompt:
  ```
   choco install jdk8
  ```
  - To install it on Ubuntu
  ```
    sudo apt-get install openjdk-8-jdk
  ```
 ## Maven
  - To install it through powershell or command prompt:
  ```
   choco install maven
  ```
  - To install it on Ubuntu
  ```
   sudo apt-get install maven
  ```
 ## Intellij / Eclipse
  - To install it through powershell or command prompt:
  ```
   choco install intellijidea-community
  ```
  - To install it on Ubuntu
  ```
   sudo snap install intellij-idea-community --classic
  ```
 ## Text Editor of your choice
  - To install it through powershell or command prompt:
  ```
   choco install sublimetext3.app
  ```
  
 ## AWS CLI
  - To install it through powershell or command prompt:
  ```
   choco install awscli
  ```
  - To install it on Ubuntu
  ```
   sudo apt-get install awscli
  ```
# Accounts needed
## Github ( Obviously 😃)
## Domain ( eg. GoDaddy)
We will need this domain to do some real time or production use cases and in order to perform those steps, which we use in real time, we will need a domain.
## DockerHub
[https://hub.docker.com/] sign up , choose a free plan. We are going to store our docker images on this in the Docker projects
## SonarCloud
You can sign up with your github account. Create a project for yourself with a unique name.
# AWS
## Free Tier Account
Create a free tier account. Then, when you tried to sign in, you will see two options, root user and IAM user. Account we created is a root user. 
1. **Check if your account is active or not:** we can do a small test here. You can search for service EC2 ( virtual machine service). Ehwn you cliked it, if you see its details such as Instances, deedicated hosts, Elastic IPs etc, it means that your account is active. Otherwise, we eill get some error in that section such as verify your phone etc.
2. 1. **Create a user :** The user we have created is a root user, and it is not recommended to usig root user for services. Therefore, we will create another user which is called IAM user. In the search bar, write iam user and find IAM, click on it. First thing is adding an MFA, which is a multi-factor authentication. Here, you need to install a software on your phone, which is google authenticator and it is going to show six digit code when we tried to log in to the account, you need to enter that MFA along with you password. MFA device can also be a Security key ( YubiKey or other supported FIDO security key.) or Hardware TOTP (time-based one time password) token. 
   - click add MFA >> click assign MFA >> MFA device is basically your phone. Choose Authenticator app, click on Next, now, install the google authenticator to your phone. Then Open your authenticator app, chose Show QR code on the website page, the use the app to scan the code. Then enter the MFA codes
 ## IAM with MFA
1. We will create another user, so go to the users, here, we have two different account, one of them is root account, and the other is IAM. root account has complete access to your account, but for IAM user, you can control access. 
- Click on add users >> enter a user name ( eg. itadmin), check "provide user access to the AWS Management Console", click on "I want to create an IAM user" and then click next. By thefault, user will not have any permission. You can assign permission to this user by attaching policies. To do it, 'select Attach policies directly' option, then you can choose th e policies you wanted to add. eg. I will add AdministaratorAccess policy. go next and create user.In the last step, password will be retrieved for you, you can download a csv file, or copy it somewhere else, but save it. 
2. We can also set an MFA for IAM user like we did in the root user. click the itadmin ( IAM user name), go to the security credientials, click assign MFA device and do the same process you have done in the root account.
## Billing Alarm
we will set billing alarm by usig a service called cloudwatch. For that we need to enable few options in billing section. To access billing section, click the dropdown menu located on the right upper side. 
Initially, you wont see any bills as you havent used it yet. But sometimes if you used paid services and forget to clean up resources, then you can see bills.
1. Go to the billing preferences on tle left menu, edit invoice delivery preferences, check 'PDF invoices delevered by email', update it.
2. Edit alert preferences. Check 'receive AWS Free Tier Alerts', put you email adress there., check 'Receive CloudWatch billing alerts' as well. Update it.
3. Search for CloundWatch in the search bar. CloudWatch is a monitoring service. Select North Virgina ( US EAST), go to the alarms, click on all alarms, click create alarm. Select metric as billing, click total estimated charge, select usd and click Select metric. Set you conditions, click next. Create new topic and enter your email, then click next, give name to your alarm, click next, the create the alarm.
## Certificate Setup 
(we will be using it for setting up https secure connection)
We need to create a public certificate for our domain. We will use a certificate to validate the certificate with the domain.
1. Search for the service called acm (Certificate Manager), click request certificate, >> public certificate > enter your domain name as  
 >*.domainname 
 and click request

