# Tools needed to be installed
 ## Oracle vm virtualbox
 - To install it through powershell or command prompt:
 > choco install virtualbox --version=6.1.40 (you can search for the latest version)
 - To install it on Ubuntu
 > sudo apt update
 > sudo apt install virtualbox
 ## GIT Bash
  - To install it through powershell or command prompt:
  > choco install git
  - To install it on Ubuntu
  >  apt install git
 ## Vagrant
  - To install it through powershell or command prompt:
  > choco install vagrant
   - To install it on Ubuntu
   > curl -O https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb |  sudo apt install ./vagrant_2.2.9_x86_64.deb
 ## Chocolatey(windows) / Brew (MacOS)
 - Chocolatey is a tool in Windows to install softwares through command line like
 > choco install notepad++ 
 - This is not a mandatory tool. You can just search for software on the internet, download & install it. 
 - open Powershell or command prompt and run the command and install the software
 - To install chocolatey go to their website through this link [https://chocolatey.org/install] and follow the steps.
 - You have to run powershell as an administrator. After installed it, you can search for any software in the website [https://community.chocolatey.org/packages], find the command and run it on you computer to install that software.
 > eg. choco intall virtualbox
 ## JDK8
  - To install it through powershell or command prompt:
  > choco install jdk8
  - To install it on Ubuntu
  >  sudo apt-get install openjdk-8-jdk
 ## Maven
  - To install it through powershell or command prompt:
  > choco install maven
  - To install it on Ubuntu
  > sudo apt-get install maven
 ## Intellij / Eclipse
  - To install it through powershell or command prompt:
  > choco install intellijidea-community
  - To install it on Ubuntu
  > sudo snap install intellij-idea-community --classic
 ## Text Editor of your choice
  - To install it through powershell or command prompt:
  > choco install sublimetext3.app
  
 ## AWS CLI
  - To install it through powershell or command prompt:
  > choco install awscli
  - To install it on Ubuntu
  > sudo apt-get install awscli
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
 ## IAM with MFA
3. **Create a user :** The user we have created is a root user, and it is not recommended to usig root user for services. Therefore, we will create another user which is called IAM user. In the search bar, write iam user and find IAM, click on it. First thing is adding an MFA, which is a multi-factor authentication. Here, you need to install a software on your phone, which is google authenticator and it is going to show six digit code when we tried to log in to the account, you need to enter that MFA along with you password. MFA device can also be a Security key ( YubiKey or other supported FIDO security key.) or Hardware TOTP (time-based one time password) token. 
   - click add MFA >> click assign MFA >> MFA device is basically your phone. Choose Authenticator app, click on Next, now, install the google authenticator to your phone. Then Open your authenticator app, chose Show QR code on the website page, the use the app to scan the code. Then enter the MFA codes
- 
- Billing Alarm
- Certificate Setup (we will be using it for setting up https secure connection)

