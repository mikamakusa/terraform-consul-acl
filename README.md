## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_consul"></a> [consul](#requirement\_consul) | 2.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_consul"></a> [consul](#provider\_consul) | 2.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [consul_acl_auth_method.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/resources/acl_auth_method) | resource |
| [consul_acl_binding_rule.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/resources/acl_binding_rule) | resource |
| [consul_acl_policy.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/resources/acl_policy) | resource |
| [consul_acl_role.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/resources/acl_role) | resource |
| [consul_acl_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/resources/acl_role_policy_attachment) | resource |
| [consul_acl_token.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/resources/acl_token) | resource |
| [consul_acl_token_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/resources/acl_token_policy_attachment) | resource |
| [consul_acl_token_role_attachment.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/resources/acl_token_role_attachment) | resource |
| [consul_acl_auth_method.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/data-sources/acl_auth_method) | data source |
| [consul_acl_policy.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/data-sources/acl_policy) | data source |
| [consul_acl_role.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/data-sources/acl_role) | data source |
| [consul_acl_token.this](https://registry.terraform.io/providers/hashicorp/consul/2.21.0/docs/data-sources/acl_token) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accessor_id"></a> [accessor\_id](#input\_accessor\_id) | n/a | `string` | `null` | no |
| <a name="input_auth_method"></a> [auth\_method](#input\_auth\_method) | n/a | <pre>list(object({<br/>    id             = any<br/>    name           = string<br/>    type           = string<br/>    config_json    = optional(string)<br/>    description    = optional(string)<br/>    display_name   = optional(string)<br/>    max_token_ttl  = optional(string)<br/>    namespace      = optional(string)<br/>    partition      = optional(string)<br/>    token_locality = optional(string)<br/>    namespace_rule = optional(list(object({<br/>      bind_namespace = string<br/>      selector       = optional(string)<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_auth_method_name"></a> [auth\_method\_name](#input\_auth\_method\_name) | n/a | `string` | `null` | no |
| <a name="input_binding_rule"></a> [binding\_rule](#input\_binding\_rule) | n/a | <pre>list(object({<br/>    id             = any<br/>    auth_method_id = any<br/>    bind_name      = string<br/>    bind_type      = string<br/>    description    = optional(string)<br/>    namespace      = optional(string)<br/>    partition      = optional(string)<br/>    selector       = optional(string)<br/>    bind_vars = optional(list(object({<br/>      name = optional(string)<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | n/a | <pre>list(object({<br/>    id          = any<br/>    name        = string<br/>    rules       = string<br/>    description = optional(string)<br/>    datacenters = optional(list(string))<br/>    namespace   = optional(string)<br/>    partition   = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | n/a | `string` | `null` | no |
| <a name="input_role"></a> [role](#input\_role) | n/a | <pre>list(object({<br/>    id          = any<br/>    name        = string<br/>    description = optional(string)<br/>    namespace   = optional(string)<br/>    partition   = optional(string)<br/>    policies_id = optional(list(any))<br/>    node_identities = optional(list(object({<br/>      datacenter = string<br/>      node_name  = string<br/>    })), [])<br/>    service_identities = optional(list(object({<br/>      service_name = string<br/>      datacenters  = optional(list(string))<br/>    })), [])<br/>    templated_policies = optional(list(object({<br/>      template_name = string<br/>      datacenters   = optional(list(string))<br/>      template_variables = optional(list(object({<br/>        name = optional(string)<br/>      })), [])<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | n/a | `string` | `null` | no |
| <a name="input_role_policy_attachment"></a> [role\_policy\_attachment](#input\_role\_policy\_attachment) | n/a | <pre>list(object({<br/>    id        = any<br/>    policy_id = any<br/>    role_id   = any<br/>  }))</pre> | `[]` | no |
| <a name="input_token"></a> [token](#input\_token) | n/a | <pre>list(object({<br/>    id              = any<br/>    accessor_id     = optional(string)<br/>    description     = optional(string)<br/>    expiration_time = optional(string)<br/>    local           = optional(bool)<br/>    namespace       = optional(string)<br/>    partition       = optional(string)<br/>    policies_id     = optional(list(any))<br/>    roles_id        = optional(list(any))<br/>    node_identities = optional(list(object({<br/>      datacenter = string<br/>      node_name  = string<br/>    })), [])<br/>    service_identities = optional(list(object({<br/>      service_name = string<br/>      datacenters  = optional(list(string))<br/>    })), [])<br/>    templated_policies = optional(list(object({<br/>      template_name = string<br/>      datacenters   = optional(list(string))<br/>      template_variables = optional(list(object({<br/>        name = optional(string)<br/>      })), [])<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_token_policy_attachment"></a> [token\_policy\_attachment](#input\_token\_policy\_attachment) | n/a | <pre>list(object({<br/>    id        = any<br/>    policy_id = any<br/>    token_id  = any<br/>  }))</pre> | `[]` | no |
| <a name="input_token_role_attachment"></a> [token\_role\_attachment](#input\_token\_role\_attachment) | n/a | <pre>list(object({<br/>    id       = any<br/>    role_id  = any<br/>    token_id = any<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_auth_method_id"></a> [auth\_method\_id](#output\_auth\_method\_id) | # consul\_acl\_auth\_method |
| <a name="output_auth_method_name"></a> [auth\_method\_name](#output\_auth\_method\_name) | n/a |
| <a name="output_binding_rule_auth_method"></a> [binding\_rule\_auth\_method](#output\_binding\_rule\_auth\_method) | n/a |
| <a name="output_binding_rule_id"></a> [binding\_rule\_id](#output\_binding\_rule\_id) | # consul\_acl\_binding\_rule |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | # consul\_acl\_policy |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | n/a |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | # consul\_acl\_role |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | n/a |
| <a name="output_role_policy_attachment_id"></a> [role\_policy\_attachment\_id](#output\_role\_policy\_attachment\_id) | # consul\_acl\_role\_policy\_attachment |
| <a name="output_role_policy_attachment_policy"></a> [role\_policy\_attachment\_policy](#output\_role\_policy\_attachment\_policy) | n/a |
| <a name="output_token_id"></a> [token\_id](#output\_token\_id) | # consul\_acl\_token |
| <a name="output_token_name_accessor_id"></a> [token\_name\_accessor\_id](#output\_token\_name\_accessor\_id) | n/a |
| <a name="output_token_policy_attachment_id"></a> [token\_policy\_attachment\_id](#output\_token\_policy\_attachment\_id) | # consul\_acl\_token\_policy\_attachment |
| <a name="output_token_policy_attachment_policy"></a> [token\_policy\_attachment\_policy](#output\_token\_policy\_attachment\_policy) | n/a |
| <a name="output_token_role_attachment_id"></a> [token\_role\_attachment\_id](#output\_token\_role\_attachment\_id) | # consul\_acl\_token\_role\_attachment |
| <a name="output_token_role_attachment_role"></a> [token\_role\_attachment\_role](#output\_token\_role\_attachment\_role) | n/a |
