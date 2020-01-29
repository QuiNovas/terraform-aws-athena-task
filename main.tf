module "athena_task" {
  environment_variables = {
    AWS_ATHENA_REGION_NAME    = local.aws_athena_region_name
    AWS_ATHENA_S3_STAGING_DIR = var.athena_s3_staging_dir
    AWS_ATHENA_SCHEMA_NAME    = var.athena_schema_name
    POLL_INTERVAL             = var.poll_interval
  }

  dead_letter_arn = var.dead_letter_arn
  handler         = "function.handler"
  kms_key_arn     = var.kms_key_arn
  l3_object_key   = "quinovas/athena-task/athena-task-0.0.3.zip"
  memory_size     = var.memory_size
  name            = "${var.name_prefix}athena-task"

  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonAthenaFullAccess",
    aws_iam_policy.non_default_staging_dir_access.arn,
    var.athena_datasource_policy_arn,
  ]
  runtime = "python3.7"
  source  = "QuiNovas/lambdalambdalambda/aws"
  timeout = var.timeout
  version = "3.0.1"
}

resource "aws_iam_policy" "non_default_staging_dir_access" {
  name   = "${var.name_prefix}appsync-athena-task-staging-s3-access"
  policy = data.aws_iam_policy_document.non_default_staging_dir_access.json
}
