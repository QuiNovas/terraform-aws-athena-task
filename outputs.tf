output "arn" {
  description = "The arn of athena task Lambda function"
  value       = "${module.athena_task.arn}"
}

output "invoke_policy_arn" {
  description = "The arn of the invocation policy athena task Lambda function"
  value       = "${module.athena_task.invoke_policy_arn}"
}