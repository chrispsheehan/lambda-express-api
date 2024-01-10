data "archive_file" "source" {
  type        = "zip"
  source_dir  = "../src"
  output_path = "../${local.lambda-folder}/${local.lambda-zip-path}"
}

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

resource "aws_iam_role" "iam_for_lambda" {
  name               = "${local.lambda-name}-iam"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
