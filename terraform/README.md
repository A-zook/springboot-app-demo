# DevOps Spring Boot - Terraform EC2 Provisioning

This Terraform project provisions an EC2 instance with Docker, Maven, Jenkins, and Git installed.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.14+)
- SSH key pair named "May-Key-Pair" created in the AWS us-east-1 region

## Project Structure

```
terraform/
├── envs/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   ├── prod/
│   │   └── ...
│   └── stage/
│       └── ...
├── modules/
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── keypair/
│   │   └── ...
│   └── network/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── user_data/
    └── install.sh
```

## Usage

1. Navigate to the environment directory you want to deploy:

```bash
cd terraform/envs/dev
```

2. Initialize Terraform:

```bash
terraform init
```

3. Review the plan:

```bash
terraform plan
```

4. Apply the configuration:

```bash
terraform apply
```

5. Connect to your EC2 instance:

```bash
# The SSH command will be shown in the outputs
ssh -i May-Key-Pair.pem ubuntu@<instance-public-ip>
```

6. Access Jenkins:

Open your browser and navigate to: http://<instance-public-ip>:8080

The initial admin password can be found on the EC2 instance at:
```
/var/lib/jenkins/secrets/initialAdminPassword
```

## Cleanup

To destroy the resources:

```bash
terraform destroy
```