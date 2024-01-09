data "archive_file" "source" {
  type        = "zip"
  source_dir  = "../src"
  output_path = "../lambda-functions/loadbalancer-to-es.zip"
}
