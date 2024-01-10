locals {
  lambda-runtime = "nodejs18.x"
  lambda-folder = var.function-name
  lambda-zip-path = "${var.function-name}.zip"
}
