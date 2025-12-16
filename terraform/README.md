# Terraform AWS Docker App Deployment

This Terraform configuration deploys a containerized, two-tier web application (frontend app and backend API) to AWS. It sets up a robust, scalable, and secure infrastructure using an Application Load Balancer, SSL certificates, and managed DNS.

## Architecture

The infrastructure consists of the following components:

1.  **VPC**: A dedicated Virtual Private Cloud (VPC) with two public subnets spread across two Availability Zones for high availability.
2.  **EC2 Instance**: A single EC2 instance where the application containers are run using Docker Compose. The instance is configured with a `user_data` script to automate the entire setup process.
3.  **Application Load Balancer (ALB)**: An ALB that accepts incoming HTTPS traffic, terminates SSL, and routes requests to the appropriate container based on the domain name.
4.  **ACM (AWS Certificate Manager)**: Provisions and manages a free public SSL/TLS certificate for the custom domains, enabling HTTPS.
5.  **Route 53**: Manages the DNS records for the application, pointing the custom subdomains to the Application Load Balancer.
6.  **Security Groups**: Fine-grained firewall rules that allow public traffic only to the ALB, and only allow the ALB to communicate with the application on the EC2 instance.

## Prerequisites

Before you begin, ensure you have the following:
*   An AWS account with the [AWS CLI](https://aws.amazon.com/cli/) installed and configured.
*   [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed on your local machine.
*   A registered domain name managed by a **Public Hosted Zone** in AWS Route 53.

## Configuration

1.  Clone the repository.
2.  Navigate to the `terraform` directory.
3.  Create a file named `terraform.tfvars`.
4.  Add the following content to the file, replacing the placeholder values with your own:

    ```hcl
    aws_region     = "ap-south-1"
    aws_key_name   = "your-ec2-key-pair-name"
    domain_name    = "your-domain.com"
    hosted_zone_id = "YOUR_ROUTE_53_HOSTED_ZONE_ID"
    repo_url       = "https://github.com/Govardhanr2/ec2app.git"
    
    # Optional:
    # instance_type = "t3.micro"
    # app_subdomain = "app"
    # api_subdomain = "api"
    ```

## Usage

Follow these steps to deploy the infrastructure:

1.  **Initialize Terraform**:
    This will download the necessary providers and modules.
    ```sh
    terraform init
    ```

2.  **Plan the deployment**:
    This will show you a preview of the resources Terraform will create.
    ```sh
    terraform plan
    ```

3.  **Apply the configuration**:
    This will build the infrastructure. This process may take several minutes.
    ```sh
    terraform apply --auto-approve
    ```

4.  **Destroy the infrastructure**:
    When you are finished, you can tear down all the created resources using:
    ```sh
    terraform destroy --auto-approve
    ```

## Inputs

The following input variables are defined in `variables.tf` and can be configured in your `terraform.tfvars` file:

| Name             | Description                                                   | Type        | Default  |
| ---------------- | ------------------------------------------------------------- | ----------- | -------- |
| `aws_region`     | The AWS region to create resources in.                        | `string`    |`ap-south-1`|
| `aws_key_name`   | The name of your AWS key pair for SSH access.                 | `string`    | n/a      |
| `domain_name`    | The root domain name managed by Route 53.                     | `string`    | n/a      |
| `hosted_zone_id` | The ID of the Route 53 hosted zone for the domain.            | `string`    | n/a      |
| `repo_url`       | The URL of the git repository to be deployed.                 | `string`    | n/a      |
| `instance_type`  | The type of EC2 instance to launch.                           | `string`    | `t3.micro` |
| `app_subdomain`  | Subdomain for the user-facing application.                    | `string`    | `ec2app`   |
| `api_subdomain`  | Subdomain for the backend API.                                | `string`    | `ec2api`   |

## Outputs

After a successful deployment, Terraform will output the following values:

| Name        | Description                            |
| ----------- | -------------------------------------- |
| `app_url`   | The final HTTPS URL of the web app.    |
| `api_url`   | The final HTTPS URL of the backend API.|
