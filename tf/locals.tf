locals {
  lambda-runtime  = "nodejs18.x"
  lambda-name     = "${var.function-stage}-${var.function-name}"
  lambda-bucket   = "${local.lambda-name}-bucket"
  lambda-folder   = "${local.lambda-name}"
  lambda-zip-path = "${local.lambda-name}.zip"
}
