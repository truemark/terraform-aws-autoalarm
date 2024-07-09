# Terraform Wrapper for AutoAlarm

This Terraform configuration clones the AutoAlarm project from GitHub and deploys it using AWS CDK.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) 1.5.7 or later
- [AWS CLI](https://aws.amazon.com/cli/)
- [Node.js](https://nodejs.org/) and [pnpm](https://pnpm.io/)
- [AWS CDK](https://aws.amazon.com/cdk/)

## Setup

1. **Install the necessary tools:**

   Make sure you have Terraform, AWS CLI, Node.js, pnpm, and AWS CDK installed on your machine.

2. **Configure your AWS credentials using aws cli**

   Ensure your AWS CLI is configured with the necessary credentials. You can configure the AWS CLI using:

   ```aws configure```

3.  **Run Terraform init and apply with required var values from terraform-aws-autoalarm/EXAMPLE/stacks**

    Run the following commands to deploy the AutoAlarm project (prometheus_workspace_id can be ignored if no prometheus workspace exists):

    ```terraform init```
   ```terraform apply -var "region=your-region" -var "prometheus_workspace_id=your-prometheus-workspace-id"```

