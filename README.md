# AWS Account Factory for Terraform (AFT) Solution

This repository contains the Terraform configuration and deployment scripts for AWS Account Factory for Terraform (AFT), which automates the provisioning and management of AWS accounts within an AWS Control Tower environment.

## Overview

AWS Account Factory for Terraform (AFT) follows a GitOps model to automate the processes of account provisioning and account updating in an AWS Control Tower environment. AFT integrates with your existing Terraform workflows and provides a scalable, repeatable way to manage AWS accounts.

## Prerequisites

- AWS Control Tower must be set up in your management account
- Terraform >= 1.0
- AWS CLI configured with appropriate permissions
- GitHub account (if using GitHub as VCS provider)

## Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ffsclyh/aws-aft-solution.git
   cd aws-aft-solution
   ```

2. **Configure variables:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your account IDs and configuration
   ```

3. **Deploy AFT:**
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

## Configuration

### Required Variables

Update `terraform.tfvars` with your specific values:

- `ct_management_account_id`: Your Control Tower management account ID
- `log_archive_account_id`: Your log archive account ID
- `audit_account_id`: Your audit account ID
- `aft_management_account_id`: Account ID where AFT will be deployed
- `github_username`: Your GitHub username (if using GitHub)

### Repository Structure

AFT requires four additional repositories:

1. **aft-account-request**: Contains account request files
2. **aft-global-customizations**: Global customizations applied to all accounts
3. **aft-account-customizations**: Account-specific customizations
4. **aft-account-provisioning-customizations**: Customizations during account provisioning

## Deployment

The `deploy.sh` script will:

1. Check prerequisites (AWS CLI, Terraform, credentials)
2. Initialize Terraform
3. Validate the configuration
4. Create and show the execution plan
5. Apply the configuration (with confirmation)

## Module Reference

This solution uses the official AWS-IA Terraform module:
- **Source**: [aws-ia/terraform-aws-control_tower_account_factory](https://github.com/aws-ia/terraform-aws-control_tower_account_factory)
- **Registry**: [terraform-aws-control_tower_account_factory](https://registry.terraform.io/modules/aws-ia/control_tower_account_factory/aws)

## Features

- Automated account provisioning through GitOps
- Integration with AWS Control Tower
- Support for GitHub and CodeCommit
- Customizable account baselines
- Terraform state management
- CloudTrail integration
- Enterprise Support automation

## Outputs

After deployment, the following outputs will be available:

- AFT Lambda function ARNs
- Account provisioning framework details
- Event processing components

## Troubleshooting

### Common Issues

1. **Permission Errors**: Ensure your AWS credentials have the necessary permissions for Control Tower and AFT deployment
2. **Control Tower Not Set Up**: AFT requires an existing Control Tower setup
3. **Repository Access**: Ensure GitHub repositories are accessible and properly configured

### Logs

Check CloudWatch logs for AFT Lambda functions if you encounter issues during account provisioning.

## Contributing

Contributions are welcome! Please read the contributing guidelines and submit pull requests for any improvements.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues and questions:
- Create an issue in this repository
- Refer to the [AWS AFT documentation](https://docs.aws.amazon.com/controltower/latest/userguide/aft-overview.html)
- Check the [official module documentation](https://github.com/aws-ia/terraform-aws-control_tower_account_factory)