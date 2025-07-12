# what is terraform



if you already have AWS account you need to configure Terraform for AWS that followed these steps:
#### Step 1
- Go to AWS IAM (recommend ro use IAM only) 
- Click security credentials
all you need to do is fetch the information of your AWS access keys.
after you get access keys and secret keys 
- Open VS Code terminal then run command
``aws configure`` then  put the access keys and secret access on the terminal
- afterwards you will ask for default region 
- and the last you will ask default format you can fill in ``json`` format

#### To verify all of this has configured 
you can run ``aws s3 ls`` or ``ls`` if it has done you will see the output emerge
- After done now your code spaces like VSCode or git code spaces is able to authenticate with AWS

#### 