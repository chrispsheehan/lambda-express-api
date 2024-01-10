# lambda-express-api

## terraform deploy

The minimum requires deployment iam privileges are `["dynamodb:*", "s3:*", "lambda:*", "apigateway:*", "iam:*"]`

```terraform
terraform init
terraform apply
```

## lambda code

Uses the [aws-serverless-express](https://www.npmjs.com/package/aws-serverless-express) npm library.