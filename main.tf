module "athena_task" {
  environment_variables {
    AWS_ATHENA_REGION_NAME    = "${local.aws_athena_region_name}"
    AWS_ATHENA_S3_STAGING_DIR = "${var.athena_s3_staging_dir}"
    AWS_ATHENA_SCHEMA_NAME    = "${var.athena_schema_name}"
    POLL_INTERVAL             = "${var.poll_interval}"
  }

  dead_letter_arn = "${var.dead_letter_arn}"
  handler         = "function.handler"
  kms_key_arn     = "${var.kms_key_arn}"
  l3_object_key   = "quinovas/athena-task/athena-task-0.0.2.zip"
  name            = "${var.name_prefix}athena-task"

  policy_arns = [
    "${aws_iam_policy.athena_task.arn}",
    "${var.athena_datasource_policy_arn}",
  ]

  policy_arns_count = 2
  runtime           = "python3.7"
  source            = "QuiNovas/lambdalambdalambda/aws"
  timeout           = 300
  version           = "0.2.0"
}

resource "aws_iam_policy" "athena_task" {
  name   = "${var.name_prefix}athena-task"
  policy = "${data.aws_iam_policy_document.athena_task.json}"
}