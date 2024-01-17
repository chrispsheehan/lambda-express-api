# lambda-express-api

Express api running in aws lambda.

## security

Move all access settings to github. Only allow user x to create tags/run workflows manually etc.

## environments

Multiple environments are supported via [terraform workspaces](https://developer.hashicorp.com/terraform/language/state/workspaces).

- Changes to main are automatically deployed to dev.
- New tags will trigger deploy to QA.
  - `git tag v1.0.0 && git push origin --tags`
- Deploy tag to prod by manually running `Deploy Environment` workflow
  - Pass in the file name i.e. `v1.0.0.zip` along with a message.


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