# AWS To Host WordPress using Terraform#

This repository contains Terraform configurations for provisioning a scalable 3-tier architecture on AWS to host a WordPress application.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [AWS Services](#aws-services)
- [Architecture](#architecture)
- [Usage](#usage)
- [Important Decisions](#important-decisions)
- [Managing WordPress](#managing-wordpress)

## Overview

This repository provides Terraform configurations to set up a 3-tier architecture on AWS for hosting a WordPress application, consisting of a web layer, an application layer, and a database layer. This infrastructure offers scalability and high availability.

## Prerequisites

Before using the Terraform configurations, ensure you have:

- An AWS account
- Terraform installed

## AWS Services

This project utilizes several AWS services:

- **Amazon VPC**: Creates a virtual private cloud for the infrastructure.
- **Amazon EC2**: Launches instances for the web and application layers.
- **Amazon RDS**: Establishes an RDS instance for the database layer.
- **Amazon EFS**: Provides an Elastic File System for storing WordPress files.
- **Amazon ALB**: Sets up an Application Load Balancer for traffic distribution.
- **Amazon CloudWatch**: Monitors the infrastructure and collects logs and metrics.

## Architecture

The 3-tier architecture consists of a web layer, an application layer, and a database layer. Terraform provisions components such as a VPC, subnets, security groups, EC2 instances, an RDS instance, an EFS file system, and an ALB to create a scalable and highly available infrastructure for hosting the WordPress application.

![AWS-3Tier-Architecture](https://github.com/Karamkb2000/WordPress-AWS-3Tier/assets/104793458/b47c1288-2cad-454a-964e-95543bc1f654)

### Workflow:

**First Layer: Public Subnets with Internet Gateway**

- **Internet Gateway (IGW):**
  - Manages incoming/outgoing traffic.
  - Handles incoming internet-bound traffic.

- **Public Subnet in AZ1:**
  - Contains an EC2 instance handling internet-bound traffic.
  - Acts as a gateway for internet communication.

- **Public Subnet in AZ2:**
  - Provides flexibility for future expansion.
  
- **Load Balancer:**
  - Connects to the Internet Gateway.
  - Distributes incoming application traffic across multiple EC2 instances in the second layer.

**Second Layer: Private Subnets with Auto Scaling Group (AZ1 and AZ2)**

- **Private Subnet in AZ1 and AZ2:**
  - Enhances security by isolating instances.
  - Enables communication with other resources within the VPC.

- **Auto Scaling Group:**
  - Manages the number of EC2 instances based on demand.
  - Scales dynamically to handle varying loads.

**Third Layer: Private Subnets with RDS Instances (AZ1 and AZ2)**

- **Private Subnet in AZ1 and AZ2:**
  - Enhances security.
  - Isolates database instances from direct internet exposure.

- **RDS Instances:**
  - Hosts databases.
  - Provides high availability.

**Fourth Layer: EFS (Elastic File System)**

- **EFS:**
  - Shared file storage for multiple EC2 instances across all layers.
  - Facilitates collaboration and file sharing.

**Data and Request Handling:**

- **Internet-bound Traffic:**
  - Public instances handle incoming internet-bound traffic.
  - The load balancer distributes traffic among instances in the second layer.

- **Internal Communication:**
  - EC2 instances in the second layer can communicate with RDS instances in the third layer for database access.
  - All EC2 instances across layers can connect to the shared EFS storage for file storage.

## Usage

To provision the infrastructure on AWS:

1. Clone this repository: `git clone https://github.com/Karamkb2000/WordPress-AWS-3Tier.git
2. Navigate to the project directory: `cd WordPress-AWS-3Tier/src/infrastructure/`
3. Initialize Terraform: `terraform init`
4. Create a `terraform.tfvars` file with your AWS credentials and variables.

```
my_ip  = ""
region = ""
zone_one = ""
zone_two = ""
```

5. Plan the Terraform changes: `terraform plan`
6. Apply the Terraform changes: `terraform apply`

## Important Decisions

### EFS for Shared Storage:

**Decision:**
Implemented Elastic File System (EFS) for shared file storage across multiple EC2 instances.

**Explanation:**
EFS provides a scalable and shared storage solution, allowing collaboration and file sharing among instances in different layers. It simplifies data sharing, especially when instances across layers need to access common files or data.

### Monitoring EC2 Instances:

**Decision:**
Utilize CloudWatch to monitor the performance and health of EC2 instances.

**Explanation:**
Set up CloudWatch Alarms to receive notifications for specific events, such as high CPU utilization or low disk space. Monitor key metrics to ensure the availability and reliability of EC2 instances.

## Managing WordPress

Once your WordPress site is up and running, manage it through the WordPress admin dashboard. Perform tasks such as creating posts/pages, managing users, installing plugins/themes, and customizing your site.
