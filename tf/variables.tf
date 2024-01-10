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
