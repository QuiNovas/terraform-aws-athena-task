output "arn" {
  description = "The arn of athena task Lambda function"
  value       = module.athena_task.arn
}

output "invoke_arn" {
  description = "The invocation arn of this athena task Lambda function"
  value       = module.athena_task.invoke_arn
}

output "invoke_policy_arn" {
  description = "The arn of the invocation policy athena task Lambda function"
  value       = module.athena_task.invoke_policy_arn
}

output "name" {
  description = "The name of the athena task Lambda function"
  value       = module.athena_task.name
}

output "qualified_arn" {
  description = "The qualified arn of this athena task Lambda function"
  value       = module.athena_task.qualified_arn
}

output "qualified_invoke_arn" {
  description = "The qualified invocation arn of the athena task Lambda function"
  value       = module.athena_task.qualified_invoke_arn
}

