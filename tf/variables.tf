variable "region" {
  type        = string
  description = "The AWS Region to use"
  default     = "eu-west-2"
}

variable "function-name" {
  type        = string
  description = "Name of the lambda function"
  default     = "lambda-express-api"
}

variable "lambda-folder" {
  type        = string
  description = "Name of the lambda folder"
  default     = "lambda-functions"
}

variable "lambda-zip-path" {
  type        = string
  description = "Name of the lambda zip file path"
  default     = "loadbalancer-to-es.zip"
}
