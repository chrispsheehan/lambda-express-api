resource "aws_s3_bucket" "lambda-bucket" {
  bucket        = "${var.function-name}-bucket"
  force_destroy = tr
}

resource "aws_s3_object" "lambda-zip" {
  bucket        = aws_s3_bucket.lambda-bucket.id
  key           = var.function-name
  source        = data.archive_file.source.output_path
  etag          = filemd5(data.archive_file.source.output_path)
  force_destroy = true
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = data.archive_file.source.output_path
  function_name = var.function-name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.mjs"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs18.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
