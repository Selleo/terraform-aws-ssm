## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_document.session](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_document) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_idle_session_timeout"></a> [idle\_session\_timeout](#input\_idle\_session\_timeout) | Idle session timeout | `string` | `"20"` | no |
| <a name="input_kms_arn"></a> [kms\_arn](#input\_kms\_arn) | KMS arn for session encryption | `string` | n/a | yes |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | CloudWatch log group name for storing logs | `string` | n/a | yes |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Max session duration | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | SSM document name | `string` | n/a | yes |
| <a name="input_s3"></a> [s3](#input\_s3) | S3 configuration to store logs | <pre>object({<br>    bucket = string<br>    prefix = string<br>  })</pre> | <pre>{<br>  "bucket": "",<br>  "prefix": ""<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | SSM document ARN |

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_document.session](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_document) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_idle_session_timeout"></a> [idle\_session\_timeout](#input\_idle\_session\_timeout) | Idle session timeout | `string` | `"20"` | no |
| <a name="input_kms_arn"></a> [kms\_arn](#input\_kms\_arn) | KMS arn for session encryption | `string` | n/a | yes |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | CloudWatch log group name for storing logs | `string` | `""` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Max session duration | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | SSM document name | `string` | n/a | yes |
| <a name="input_s3"></a> [s3](#input\_s3) | S3 configuration to store logs | <pre>object({<br>    bucket = string<br>    prefix = string<br>  })</pre> | <pre>{<br>  "bucket": "",<br>  "prefix": ""<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | SSM document ARN |
<!-- END_TF_DOCS -->