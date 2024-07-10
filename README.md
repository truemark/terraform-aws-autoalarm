# Terraform Wrapper for AutoAlarm

This Terraform configuration downloads and unzips the AutoAlarm project from GitHub and deploys it using AWS CDK.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) 1.5.7 or later
- [AWS CLI](https://aws.amazon.com/cli/)


## Setup

1. **Install the necessary tools:**

   Make sure you have Terraform, AWS CLI, Node.js installed on your machine.

2. **Configure your AWS credentials using aws cli**

   Ensure your AWS CLI is configured with the necessary credentials. You can configure the AWS CLI using:

   ```aws configure```

3.  **Update the `terraform-aws-autoalarm/examples/base/main.tf` file with the required values**

    Update the `terraform-aws-autoalarm/examples/base/main.tf` file with the required values. The following variables are required:
    - `branch`: The branch of the AutoAlarm project to deploy. Default is `main`.
    - `region`: The AWS region where the resources will be deployed.
    - `prometheus_workspace_id`: The Prometheus workspace ID to enable Prometheus rule creation. If not using Prometheus, leave this field empty.

4. **Run Terraform init and apply with required var values from terraform-aws-autoalarm/examples/base**

    Run the following commands to deploy the AutoAlarm project (prometheus_workspace_id can be ignored if no prometheus workspace exists):

   ```terraform init```
   ```terraform apply```

