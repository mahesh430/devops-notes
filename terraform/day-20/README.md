# Terraform Overview and Installation Guide

## Overview

Terraform is an open-source infrastructure as code (IaC) tool created by HashiCorp. It allows you to build, change, and version infrastructure efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

Key features include:

- **Infrastructure as Code**: Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code.
- **Execution Plans**: Terraform has a planning step where it generates an execution plan. The execution plan shows what Terraform will do when you call apply, letting you avoid any surprises.
- **Resource Graph**: Terraform builds a graph of all your resources, and parallelizes the creation and modification of any non-dependent resources.
- **Change Automation**: Complex changesets can be applied to your infrastructure with minimal human interaction. With the execution plan and resource graph, you know exactly what Terraform will change and in what order, avoiding many possible human errors.

For more details, visit [Terraform's website](https://www.terraform.io/).

## Installation

### Prerequisites

- A working setup of command-line tools/terminal
- Administrative access to the system

### Steps to Install Terraform

1. **Download Terraform**

   Go to the [Terraform downloads page](https://www.terraform.io/downloads.html) and download the appropriate package for your operating system.

2. **Unzip the package**

   Unzip the downloaded package in a directory where you wish to keep the Terraform binary.

3. **Add Terraform to Your PATH**

   - **Windows**: 
     - Right-click on 'My Computer', then click 'Properties'.
     - Click 'Advanced system settings'.
     - In the 'System Properties' window, click the 'Environment Variables' button.
     - In the 'Environment Variables' window, highlight the 'Path' variable in the 'Systems Variable' section and click the 'Edit' button.
     - Add the path to the Terraform executable to the end of the list.
   - **MacOS/Linux**:
     - Add Terraform to your PATH using the export command: `export PATH=$PATH:/path/to/terraform/directory`

4. **Verify the Installation**

   Open a new terminal session. Run `terraform` to ensure the binary is properly installed. You should see Terraform's help output.

```bash
terraform
```
# AWS User Creation for Terraform and Local Configuration Guide

## Overview

This guide provides instructions on how to create an AWS user specifically for Terraform. Terraform is an infrastructure as code tool that allows you to manage cloud resources. Using a dedicated AWS user for Terraform is a best practice for managing AWS resources securely and effectively.

## Prerequisites

- An AWS account with administrative access
- Terraform installed on your local machine
- Basic understanding of AWS IAM (Identity and Access Management)

## Creating an AWS User for Terraform

### Step 1: Sign in to the AWS Management Console

Log in to your AWS account and go to the IAM Dashboard.

### Step 2: Create a New IAM User

1. In the IAM Dashboard, navigate to "Users" and then click "Add user".
2. Enter a user name (e.g., `terraform-user`) and select "Programmatic access" as the access type.
3. Click "Next: Permissions".

### Step 3: Attach Policies

1. Attach the necessary policies for Terraform to manage AWS resources. For broad access, attach `AdministratorAccess`. For more restricted access, attach specific policies as needed.
2. Click "Next: Tags" (optional: add tags as per your organization's standards).
3. Click "Next: Review".

### Step 4: Review and Create User

Review the details and click "Create user".

### Step 5: Download Credentials

After creating the user, download the CSV file containing the `Access key ID` and `Secret access key`. Store it securely.

## Configuring AWS Credentials Locally for Terraform

### Step 1: Install the AWS CLI

If you haven't already, install the AWS Command Line Interface (CLI). Follow the instructions here: [Installing AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

### Step 2: Configure AWS CLI with New User

1. Open your terminal or command prompt.
2. Run the following command and enter the `Access key ID` and `Secret access key` when prompted:

```bash
aws configure
