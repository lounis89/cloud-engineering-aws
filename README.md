# AWS Serverless architecture with Terraform  
This project showcases the initial stage of a data architecture on AWS. The objective is to establish a pipeline utilizing the pub/sub pattern, starting with the uploading of a file into a primary storage location (S3 bucket) consisting of raw files. This upload will generate an event that will be published to an SNS topic, and the administrator will be notified via email simultaneously. A message will be sent to an SQS queue in order to begin processing the file. This queue will trigger a lambda function that will execute the processing and store it in a secondary storage location containing the processed files.  

![architecture diagram](https://i.imgur.com/sRt1bny.png)

## Prerequisites

Before you can use this project, you need to complete the following steps:

1. Create an AWS account if you don't have one already. You can create a free account [here](https://aws.amazon.com/free/).
2. Create a user with programmatic admin access in the IAM console. This user will be used to authenticate the Terraform CLI to your AWS account. For instructions on how to do this, refer to the AWS documentation [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html).
3. Install the AWS CLI on your workstation. For instructions on how to do this, refer to the AWS documentation [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).
4. Configure the AWS CLI with your IAM user credentials. For instructions on how to do this, refer to the AWS documentation [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).


## To deploy the cloud engineering AWS project using Terraform, you can follow these steps:

[Terraform](https://www.terraform.io/) is an open-source infrastructure as code tool that allows you to define and manage your infrastructure as code. This means that you can use Terraform to create, modify, and delete resources in your cloud provider environment, such as AWS.

1. Clone the project repository to your local machine.
2. Navigate to the project directory in your terminal.
3. Run `terraform init` to initialize your Terraform configuration.
4. Run `terraform plan` to preview the changes that will be made to your infrastructure.
5. If everything looks good, run `terraform apply` to create or modify the resources defined in the configuration files.
