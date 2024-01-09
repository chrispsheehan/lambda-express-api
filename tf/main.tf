resource "aws_s3_bucket" "lambda-bucket" {
  bucket = "${var.function-name}-bucket"
}

resource "aws_s3_object" "lambda-zip" {
  bucket = aws_s3_bucket.lambda-bucket.id
  key    = var.function-name
  source = data.archive_file.source.output_path
  etag   = filemd5(data.archive_file.source.output_path)
}
