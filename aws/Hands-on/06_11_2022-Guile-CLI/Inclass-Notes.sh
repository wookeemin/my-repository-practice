# AWS CLI
# Guile - 06_11_2022

# References
# https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html
# https://awscli.amazonaws.com/v2/documentation/api/latest/index.html
# https://aws.amazon.com/blogs/compute/query-for-the-latest-amazon-linux-ami-ids-using-aws-systems-manager-parameter-store/



# Installation

# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


# Win:
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


# Mac:
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
# https://graspingtech.com/install-and-configure-aws-cli/


# Linux:
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip  #install "unzip" if not installed
sudo ./aws/install


# Configuration

aws configure

cat .aws/config
cat .aws/credentials

aws configure --profile user1

export AWS_PROFILE=user1 #account-b instead of user1
export AWS_PROFILE=default

aws configure list-profiles

aws sts get-caller-identity

# IAM
aws iam list-users

aws iam create-user --user-name aws-cli-user

aws iam delete-user --user-name aws-cli-user


# S3
aws s3 ls

aws s3 mb s3://guile-cli-bucket 'wookee instead of guile'

aws s3 cp in-class.yaml s3://guile-cli-bucket

aws s3 ls s3://guile-cli-bucket

aws s3 rm s3://guile-cli-bucket/in-class.yaml

aws s3 rb s3://guile-cli-bucket


# EC2
aws ec2 describe-instances

aws ec2 run-instances \
   --image-id ami-0022f774911c1d690 \
   --count 1 \
   --instance-type t2.micro \
   --key-name KEY_NAME_HERE # put your key name wookee-mac1 

aws ec2 describe-instances \
   --filters "Name = key-name, Values = KEY_NAME_HERE" # put your key name

aws ec2 describe-instances --query "Reservations[].Instances[].PublicIpAddress[]"

aws ec2 describe-instances \
   --filters "Name = key-name, Values = KEY_NAME_HERE" --query "Reservations[].Instances[].PublicIpAddress[]" # put your key name

aws ec2 describe-instances \
   --filters "Name = instance-type, Values = t2.micro" --query "Reservations[].Instances[].InstanceId[]"

aws ec2 stop-instances --instance-ids INSTANCE_ID_HERE # put your instance id

aws ec2 terminate-instances --instance-ids INSTANCE_ID_HERE # put your instance id

# Working with the latest Amazon Linux AMI

aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --region us-east-1

aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 'Parameters[0].[Value]' --output text
#you will get ami id

aws ec2 run-instances \
   --image-id $(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 'Parameters[0].[Value]' --output text) \
   --count 1 \
   --instance-type t2.micro

# Update AWS CLI Version 1 on Amazon Linux (comes default) to Version 2

# Remove AWS CLI Version 1
sudo yum remove awscli -y # pip uninstall awscli/pip3 uninstall awscli might also work depending on the image

# Install AWS CLI Version 2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip  #install "unzip" if not installed
sudo ./aws/install

# Update the path accordingly if needed
export PATH=$PATH:/usr/local/bin/aws



# mac user AWS CLI install and set up for remote access to AWS

#if you have sudo permissions, you can install the AWS CLI for all users on the computer. We provide the steps in one easy to copy and paste group. See the descriptions of each line in the following steps.

$ curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
$ sudo installer -pkg AWSCLIV2.pkg -target /

#Download the file using the curl command. The -o option specifies the file name that the downloaded package is written to. In this example, the file is written to AWSCLIV2.pkg in the current folder.

$ curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"

#Run the standard macOS installer program, specifying the downloaded .pkg file as the source. Use the -pkg parameter to specify the name of the package to install, and the -target / parameter for which drive to install the package to. The files are installed to /usr/local/aws-cli, and a symlink is automatically created in /usr/local/bin. You must include sudo on the command to grant write permissions to those folders.

$ sudo installer -pkg ./AWSCLIV2.pkg -target /

#After installation is complete, debug logs are written to /var/log/install.log.

#To verify that the shell can find and run the aws command in your $PATH, use the following commands.

$ which aws
/usr/local/bin/aws 
$ aws --version
aws-cli/2.4.5 Python/3.8.8 Darwin/18.7.0 botocore/2.4.5

#If the aws command cannot be found, you might need to restart your terminal or follow the troubleshooting in Troubleshooting AWS CLI errors.