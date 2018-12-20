# gcp-devops-challenge
Terraform code to provision basic infrastructure on Google Cloud Platform 

Getting Started with the Google Provider: https://www.terraform.io/docs/providers/google/getting_started.html

This Terraform create two VMs in Google Cloud Platform.  It does the following:

1). Create VPC.

2). Create Subnet.

3). Create VPC firewall configuration.

4). Create two VMs.

5). Print external IP address on stdout.

I tested the code with CentOS 7.6 and Terraform v0.11.11. It should work with other linux distro and Terraform version but that is not tested. I suggest to use the same version to get best experience. 

\# cat /etc/redhat-release 
CentOS Linux release 7.6.1810 (Core) 

\# terraform --version
Terraform v0.11.11

Dependency

- You should enable the Google Compute Engine API. This only needs to be done once per project to make the API accessible.

- In order to make requests against the GCP API, you need to authenticate to prove that it's you making the request. The preferred method of provisioning resources with Terraform is to use a GCP service account, a "robot account" that can be granted a limited set of IAM permissions. From the service account key page in the Cloud Console choose an existing account, or create a new one. Next, download the JSON key file. Name it something you can remember, and store it somewhere secure on your machine.

Use the followin steps to test:

step 1: 

Install terraform v0.11.11 on your linuix machine.

\# wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip

\# yum install unzip

\# unzip terraform_0.11.11_linux_amd64.zip 

\# mv terraform /usr/bin/

\# terraform -v
Terraform v0.11.11

step 2:

Get the code from my repo

\# cd /opt

\# curl -L -O https://github.com/thefossgeek/gcp-devops-challenge/archive/master.zip

\# unzip master.zip

\# cd gcp-devops-challenge

step 3:

Change the below configuration entry to your values and save.

\# vim terraform/terraform.tfvars 
region           = "asia-south1"
zone             = "asia-south1-a"
gcp_project      = "red-shape-225906"
credentials      = "credentials.json"


step 4:

gererate ssh key which you can use to login to vm

\# /usr/bin/ssh-keygen -q -t rsa -N ''

step 5:
Deploy VM

\# cd /opt/cp-devops-challenge/terraform

\# terraform init

\# terraform apply

Step 6:

Destroy VM

\# terraform destroy

NOTE: The Docker workflow available to build dockar imnage and run it from container.

