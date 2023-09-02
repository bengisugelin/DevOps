We will talk about AWS CLI (Command line interface)

What we rae doing through the console or graphically, can also be done through the CLI. Let's see how we can find out commands for our tasks and execute them.

But before that, we should have AWS CLI installed on our computer. 

If you're using windows: open pwershell as an admin

```
choco install awscli
```

Now, let's open gitbash:

```
$ aws --version
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/2b7d7b70-60f7-49f6-afe0-f14531dcc452)

next step is configuring AWS CLI. You need to have an IAM user. Go to IAM service -> Users -> add(create) users

![image](https://github.com/bengisugelin/DevOps/assets/113550043/2c6b420e-9f7d-42de-9b44-8b00acf67da7)


![image](https://github.com/bengisugelin/DevOps/assets/113550043/3555742c-3626-4de8-82cf-84eb9e161b92)


![image](https://github.com/bengisugelin/DevOps/assets/113550043/f8cbf11c-0d8e-47fc-91ca-48c09e4eb0e1)


![image](https://github.com/bengisugelin/DevOps/assets/113550043/3ff444f4-725e-4c12-9cd0-f2fb76bda2f4)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/895cc714-211d-4b97-8f63-91c1cb639284)


click on username and go to security credentials. In order to use this CLI, we need an access key. Click create access key

![image](https://github.com/bengisugelin/DevOps/assets/113550043/8d147ce3-a0cd-4e04-b59d-9f3036a568d6)

select the first option , Command Line Interface:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/69dcbed5-a3d1-499f-a6e3-ea7dd239c44b)

check the I understand checkbox and click next. click create access key button.


Now we have our access key. It has two part, like username and password.

**Do not reveal your access key and secret key to anybody else!**  Especially in this case, because it has administratir access 

![image](https://github.com/bengisugelin/DevOps/assets/113550043/83b9b235-48bf-4967-b734-d99c1a026aa5)

You can scroll down and download .csv file, it has access key and secret key.

now, open the gitbash and execute the command.

```
$ aws configure
```

it will ask you the access key and secret key. write them and give the region name and output format.

![image](https://github.com/bengisugelin/DevOps/assets/113550043/573b3340-c4e7-488c-97ec-cb0dad3a68b5)

so these info is stroed in the configuration file:

```
$ ls ~/.aws/
config  credentials
```
![image](https://github.com/bengisugelin/DevOps/assets/113550043/0117e958-c110-44a5-b5c4-64a6318bcd8e)


and in the credentials file, we have the keys.


![image](https://github.com/bengisugelin/DevOps/assets/113550043/adc4aeee-c695-4dbb-a3e9-d3ecbda5a7b6)


Once you hit the done button, the access key and secret key will be gone.

so if you dont have the keys, you cannot get it back. You can create a new key. 

If sth happend and your keys are comprimised, you can either deactivate or delete the key, rather than deleting the user.


All the commands we can use in AWS CLI can be found via this link:

https://awscli.amazonaws.com/v2/documentation/api/latest/index.html








