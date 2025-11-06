# Outputs for AWS Account Factory for Terraform (AFT)

output "aft_account_provisioning_framework_lambda_arn" {
  description = "AFT Account Provisioning Framework Lambda ARN"
  value       = module.aft.aft_account_provisioning_framework_lambda_arn
}

output "aft_account_request_framework_lambda_arn" {
  description = "AFT Account Request Framework Lambda ARN"
  value       = module.aft.aft_account_request_framework_lambda_arn
}

output "aft_controltower_event_logger_lambda_arn" {
  description = "AFT Control Tower Event Logger Lambda ARN"
  value       = module.aft.aft_controltower_event_logger_lambda_arn
}

output "aft_account_request_processor_lambda_arn" {
  description = "AFT Account Request Processor Lambda ARN"
  value       = module.aft.aft_account_request_processor_lambda_arn
}

output "aft_invoke_aft_account_provisioning_framework_lambda_arn" {
  description = "AFT Invoke Account Provisioning Framework Lambda ARN"
  value       = module.aft.aft_invoke_aft_account_provisioning_framework_lambda_arn
}

output "aft_account_request_audit_trigger_lambda_arn" {
  description = "AFT Account Request Audit Trigger Lambda ARN"
  value       = module.aft.aft_account_request_audit_trigger_lambda_arn
}