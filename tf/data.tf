data "archive_file" "source" {
  type        = "zip"
  source_dir  = "../src"
  output_path = "../${var.lambda-folder}/${var.lambda-zip-path}"
}
