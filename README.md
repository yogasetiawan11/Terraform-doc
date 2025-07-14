# What is terraform
Terraform is Iac (Infrastructure as Code) or a tool for infrastrcture provisioning.

what does it means?
let's say you started a project where you want to create some Application 
and you want to set up some infrastructure from scratch where this Application will run 

How does your App looks like
let's say you want to spin up several server or you will deploy 5 Micro apps that make up as docker kontainer 
and you also going to deploy a Database and you decide AWS to build your whole infrastructure and the first step will be to go to AWS to prepare the set up.
so the apps can be deploy there, this means you create Private Network space, you create server in EC2, you install docker each one of those, 
you set up security on the servers like firewall, plus any other tools that you might need for your app.

if you have knowlege on just Terraform only, it's enough you just need to learn Terraform languange that is HCL (hashicorp language)

There are 2 to creating the whole set up. 
1. Provisioning infrastructure. 
2. Deploying applicaition. 
This is how provisioning looks like and with Terraform you can create Infrastrcture using `Code`.

# Why Terraform 
as person who create infrastructure you might have to deal with a lot of thing. 
let's say in your organization using AWS, and one of project in organization using GCP, when you move to different company where they use Azure, or openstack.
every cloud provide has its own iac tools like AWS with (cloud formation template), opentstack come with (heat template), GCP with (CDKTF). 
it can be difficult if you learn all of this tools together. Terraform comes to solve this problem you can use terraform it is irrespective of the provider that you are using.
