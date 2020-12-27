# Terraform Job for Nuspire

[![Terraform](https://img.shields.io/badge/Built%20With-Terraform-blueviolet?style=for-the-badge)](https://www.terraform.io/) [![Ansible](https://img.shields.io/badge/Built%20With-Ansible-red?style=for-the-badge)](https://www.ansible.com/)
[![AWS](https://img.shields.io/badge/Built%20With-AWS-orange?style=for-the-badge)](https://aws.amazon.com/)

## Part 1 - Terraform Configuration
## Prerequisites:
 - Machine with at least Terraform 12.06 Installed **(This step is very important. The program will not run unless this version or a newer one is installed)**
 - Machine with AWS CLI installed and configured
 - Internet connection
 - Access to an AWS Account

## Steps:
The first step is to clone and enter the github repository:

`git clone https://github.com/moonbeam87/Terraform-Job.git`

`cd Terraform-Job`

After cloning the repo, the next step you want to take is to zip the directory called LambdaExample. In case if the directory is empty, just remove it:

`rm -rf LambdaExample`

and then call the following command:

`git clone https://github.com/moonbeam87/LambdaExample.git`

To zip the directory, run the following:

`sh zip.sh`

After having a zip file, the next step is to begin the terraform creation process:

`terraform init`

`terraform plan`

`terraform appy`

After this, all the AWS resources should be created in your account. The first step you will want to take is to check to make sure you have ssh access to your EC2 Instance. **Depending on your terraform version, you may have issues establishing SSH access. In that case, go to your default security group, and add a rule for SSH access on port 22 from your IP address.**

## Part 2 and 3:
Visit this reposity for code and instructions:
[Part 2 and 3](https://github.com/moonbeam87/terraform-job-ansible.git)

