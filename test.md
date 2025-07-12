# what is terraform
Terraform is Iac (Infrastructure as Code) or a tool for infrastrcture provisioning. what does it means?
let's say you started a project where you want to create some Application and you want to set up some infrastructure from scratch where this Application will run 
How does your App looks like
let's say you want to spin up several server or you will deploy 5 Micro apps that make up as docker kontainer and you also going to deploy a Database and you decide AWS to build your whole infrastructure 
and the first step will be to go to AWS to prepare the set up. so the apps can be deploy there, this means you create Private Network space, you create server in EC2, you install docker each one of those, you set up security on the servers like firewall, plus any other tools that you might need for your app. so there are 2 to creating the whole set up. 1. Provisioning infrastructure, 2. Deploying applicaition. 
This is how provisioning looks like and with Terraform you can create Infrastrcture using `Code`.


if you already have AWS account you need to configure Terraform for AWS that followed these steps:
#### Step 1
- Go to AWS IAM (recommend ro use IAM only) 
- Click security credentials
all you need to do is fetch the information of your AWS access keys.
copy the both ID key and secret after you get access keys ID and secret keys 
- Open VS Code terminal then run command
``aws configure`` then  put the access keys ID and secret access on the terminal
- afterwards you will ask for default region 
- and the last you will ask default format you can fill in ``json`` format

#### To verify all of this has configured 
you can run ``aws s3 ls`` or ``ls`` if it has done you will see the output emerge
- After done now your code spaces like VSCode or git code spaces is able to authenticate with AWS

#### 