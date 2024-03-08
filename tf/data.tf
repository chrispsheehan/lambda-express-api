data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# data "aws_iam_policy_document" "whitelist_ips" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["*"]
#     }

#     effect    = "Allow"
#     actions   = ["execute-api:Invoke"]
#     resources = ["${aws_api_gateway_rest_api.this.execution_arn}/*/*/*"]
#   }

#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["*"]
#     }

#     effect    = "Deny"
#     actions   = ["execute-api:Invoke"]
#     resources = ["${aws_api_gateway_rest_api.this.execution_arn}/*/*/*"]

#     condition {
#       test     = "NotIpAddress"
#       variable = "aws:SourceIp"
#       values   = var.whitelist_ips
#     }
#   }
# }
