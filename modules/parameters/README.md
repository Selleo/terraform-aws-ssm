## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_context"></a> [context](#input\_context) | Project context | <pre>object({<br>    namespace = string<br>    stage     = string<br>    name      = string<br>  })</pre> | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | Parameter store path for all secrets. If empty then defaults to /namespace/stage/name. | `string` | `""` | no |
| <a name="input_readonly"></a> [readonly](#input\_readonly) | Indicates whether secrets are dispalyed as read-only in the custom editor | `bool` | `false` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Key-value map of secrets | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secrets"></a> [secrets](#output\_secrets) | Store Parameters as Name-ARN map |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.this_editable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_context"></a> [context](#input\_context) | Project context | <pre>object({<br>    namespace = string<br>    stage     = string<br>    name      = string<br>  })</pre> | n/a | yes |
| <a name="input_editable_path"></a> [editable\_path](#input\_editable\_path) | Parameter store path for all editable secrets. If empty then defaults to `/$namespace/$stage/$name/editable.` | `string` | `""` | no |
| <a name="input_editable_secrets"></a> [editable\_secrets](#input\_editable\_secrets) | Key-value map of secrets that can be edited via UI | `map(string)` | `{}` | no |
| <a name="input_path"></a> [path](#input\_path) | Parameter store path for all secrets. If empty then defaults to `/$namespace/$stage/$name/terraform`. | `string` | `""` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Key-value map of secrets. That can only be edited via Terraform. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_editable_secrets"></a> [editable\_secrets](#output\_editable\_secrets) | Store Parameters as Name-ARN map |
| <a name="output_secrets"></a> [secrets](#output\_secrets) | Store Parameters as Name-ARN map |
<!-- END_TF_DOCS -->