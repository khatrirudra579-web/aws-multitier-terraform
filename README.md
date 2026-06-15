# AWS Multi-Tier Infrastructure with Terraform

## Overview

Provisioned a complete AWS multi-tier architecture using Terraform Infrastructure as Code (IaC).

# Services Used

- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Application Load Balancer
- Auto Scaling Group
- EC2 Instances
- Amazon RDS MySQL

## Architecture

![Architecture](screenshots/architecture.png)

## Application

![Application](screenshots/application.png)

## Load Balancer

![ALB](screenshots/alb.png)

## Target Group Health

![Target Group](screenshots/target-group.png)

## RDS Database

![RDS](screenshots/rds.png)

## VPC

![VPC](screenshots/vpc.png)

## Deployment

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## Outputs

- ALB DNS Name
- RDS Endpoint
- VPC ID
