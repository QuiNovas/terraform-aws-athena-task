data "aws_iam_policy_document" "athena_task" {
  statement {
    actions = [
      "athena:StopQueryExecution",
      "athena:StartQueryExecution",
      "athena:RunQuery",
      "athena:ListQueryExecutions",
      "athena:GetTables",
      "athena:GetTable",
      "athena:GetQueryResultsStream",
      "athena:GetQueryResults",
      "athena:GetQueryExecutions",
      "athena:GetQueryExecution",
      "athena:GetNamespaces",
      "athena:GetNamespace",
      "athena:GetExecutionEngines",
      "athena:GetExecutionEngine",
      "athena:GetCatalogs",
      "athena:CancelQueryExecution",
      "athena:BatchGetQueryExecution",
      "glue:GetTable",
      "glue:GetPartitions",
    ]

    resources = [
      "*",
    ]

    sid = "AllowAthenaAccess"
  }

  statement {
    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
    ]

    resources = [
      "${var.athena_s3_arn}/*",
      "${var.athena_s3_arn}",
    ]

    sid = "ReadWriteResultFiles"
  }
}
