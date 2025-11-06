# Variables for AWS Account Factory for Terraform (AFT)

variable "aws_region" {
  description = "AWS region for AFT deployment"
  type        = string
  default     = "us-east-1"
}

variable "ct_management_account_id" {
  description = "Control Tower management account ID"
  type        = string
}

variable "log_archive_account_id" {
  description = "Log Archive account ID"
  type        = string
}

variable "audit_account_id" {
  description = "Audit account ID"
  type        = string
}

variable "aft_management_account_id" {
  description = "AFT management account ID"
  type        = string
}

variable "ct_home_region" {
  description = "Control Tower home region"
  type        = string
  default     = "us-east-1"
}

variable "tf_backend_secondary_region" {
  description = "Secondary region for Terraform backend"
  type        = string
  default     = "us-west-2"
}

variable "vcs_provider" {
  description = "Version control system provider (github or codecommit)"
  type        = string
  default     = "github"
  validation {
    condition     = contains(["github", "codecommit"], var.vcs_provider)
    error_message = "VCS provider must be either 'github' or 'codecommit'."
  }
}

variable "account_request_repo_name" {
  description = "Repository name for account requests"
  type        = string
  default     = "aft-account-request"
}

variable "global_customizations_repo_name" {
  description = "Repository name for global customizations"
  type        = string
  default     = "aft-global-customizations"
}

variable "account_customizations_repo_name" {
  description = "Repository name for account customizations"
  type        = string
  default     = "aft-account-customizations"
}

variable "account_provisioning_customizations_repo_name" {
  description = "Repository name for account provisioning customizations"
  type        = string
  default     = "aft-account-provisioning-customizations"
}

variable "github_username" {
  description = "GitHub username (required if using GitHub as VCS)"
  type        = string
  default     = ""
}

variable "aft_feature_cloudtrail_data_events" {
  description = "Enable CloudTrail data events"
  type        = bool
  default     = false
}

variable "aft_feature_enterprise_support" {
  description = "Enable Enterprise Support"
  type        = bool
  default     = false
}

variable "aft_feature_delete_default_vpcs_enabled" {
  description = "Enable deletion of default VPCs"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to AFT resources"
  type        = map(string)
  default = {
    "Project"     = "AFT"
    "Environment" = "production"
    "ManagedBy"   = "Terraform"
  }
}