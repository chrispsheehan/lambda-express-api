# lambda-express-api

## terraform

Minimum requires deployment iam privileges.

```json
[
    "dynamodb:*", 
    "s3:*", 
    "lambda:*", 
    "apigateway:*",
    "iam:*"
]
```


## ci

Commits to `main` will kick off a deployment.

Required github action variables.
- `AWS_ACCOUNT_ID`
- `AWS_REGION`
- `AWS_ROLE` role with deployment privileges
- `AWS_ROLE_VALIDATE_ONLY` role with readonly privileges (can be same as `AWS_ROLE`)


## lambda code

Uses the [aws-serverless-express](https://www.npmjs.com/package/aws-serverless-express) npm library.