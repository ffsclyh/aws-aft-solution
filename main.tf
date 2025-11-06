# AWS Account Factory for Terraform (AFT) Configuration
# Using the official aws-ia/terraform-aws-control_tower_account_factory module

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# AFT Module
module "aft" {
  source = "aws-ia/control_tower_account_factory/aws"

  # Core AFT Configuration
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id           = var.audit_account_id
  aft_management_account_id  = var.aft_management_account_id
  ct_home_region            = var.ct_home_region
  tf_backend_secondary_region = var.tf_backend_secondary_region

  # VCS Configuration
  vcs_provider                         = var.vcs_provider
  account_request_repo_name           = var.account_request_repo_name
  global_customizations_repo_name     = var.global_customizations_repo_name
  account_customizations_repo_name    = var.account_customizations_repo_name
  account_provisioning_customizations_repo_name = var.account_provisioning_customizations_repo_name

  # Optional: GitHub Configuration (if using GitHub)
  github_username = var.github_username

  # Feature Flags
  aft_feature_cloudtrail_data_events = var.aft_feature_cloudtrail_data_events
  aft_feature_enterprise_support     = var.aft_feature_enterprise_support
  aft_feature_delete_default_vpcs_enabled = var.aft_feature_delete_default_vpcs_enabled

  tags = var.tags
}