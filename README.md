#tf_apigw_mapping
A module used for mapping settings and lambdas to appropriate api gateways and their resources
#### Table of Contents
1. [Usage](#usage)
2. [Requirements](#requirements)
3. [Providers](#Providers)
2. [Inputs](#inputs)
3. [Outputs](#outputs)
4. [Dependencies - Required external modules](#dependencies)
## Usage
Add to your terraform code.
```hcl
  module "cap-apigw-resource-mapping-module" {
    source = "git@github.com:beaudryj/cap-apigw-resource-mapping-module.git"
    input_name        = "var.input_name"
  }
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements
| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 2.0 |
## Providers
| Name | Version |
|------|---------|
| aws | ~> 2.0 |
## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_method | id of rest api to deploy to | `string` | `""` | no |
| api\_name | The name of the API Gateway | `string` | `"change me"` | no |
| auth\_lambda\_name | The name of the auth Lambda function | `string` | `"change me"` | no |
| auth\_token\_regex | Regex used for validating incoming token | `string` | n/a | yes |
| auth\_ttl | The TTL of cached authorizer results in seconds. | `string` | `"300"` | no |
| authorizer\_name | The name of the authorizer | `string` | `"change me"` | no |
| domain\_name | The fully-qualified domain name to register | `string` | n/a | yes |
| function\_name | The name of the Lambda function | `string` | `"changeme"` | no |
| gateway\_execution\_arn | API Gateway Execution ARN | `string` | `"change me"` | no |
| gatewayed\_lambda\_arn | ARN of Lambda in Gateway | `string` | `"changeme"` | no |
| gatewayed\_lambda\_name | ARN of Lambda in Gateway | `string` | `"changeme"` | no |
| invocation\_role\_name | The name of the role to attach to the authorizer | `string` | `"change me"` | no |
| request\_parameters | n/a | `map` | <pre>{<br>  "method.request.querystring.date": true<br>}</pre> | no |
| resource\_id | id of api resource | `string` | `""` | no |
| resource\_name | name of resource to be used for invocation permission | `string` | `""` | no |
| rest\_api\_id | if of rest api to deploy to | `string` | `""` | no |
| stage\_name | The name of the deployment stage | `string` | `"change me"` | no |
| tags | Default Tags | `map` | n/a | yes |
| uuid | Optional variable used for namespacing | `string` | `""` | no |
## Outputs
| Name | Description |
|------|-------------|
| base\_url | n/a |
| invoke\_url | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Dependencies
N/A