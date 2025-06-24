## consul_acl_auth_method
output "auth_method_id" {
  value = try(consul_acl_auth_method.this.*.id)
}

output "auth_method_name" {
  value = try(consul_acl_auth_method.this.*.name)
}

## consul_acl_binding_rule
output "binding_rule_id" {
  value = try(consul_acl_binding_rule.this.*.id)
}

output "binding_rule_auth_method" {
  value = try(consul_acl_binding_rule.this.*.auth_method)
}

## consul_acl_policy
output "policy_id" {
  value = try(consul_acl_policy.this.*.id)
}

output "policy_name" {
  value = try(consul_acl_policy.this.*.name)
}

## consul_acl_role
output "role_id" {
  value = try(consul_acl_role.this.*.id)
}

output "role_name" {
  value = try(consul_acl_role.this.*.name)
}

## consul_acl_role_policy_attachment
output "role_policy_attachment_id" {
  value = try(consul_acl_role_policy_attachment.this.*.id)
}

output "role_policy_attachment_policy" {
  value = try(consul_acl_role_policy_attachment.this.*.policy)
}

## consul_acl_token
output "token_id" {
  value = try(consul_acl_token.this.*.id)
}

output "token_name_accessor_id" {
  value = try(consul_acl_token.this.*.accessor_id)
}

## consul_acl_token_policy_attachment
output "token_policy_attachment_id" {
  value = try(consul_acl_token_policy_attachment.this.*.id)
}

output "token_policy_attachment_policy" {
  value = try(consul_acl_token_policy_attachment.this.*.policy)
}

## consul_acl_token_role_attachment
output "token_role_attachment_id" {
  value = try(consul_acl_token_role_attachment.this.*.id)
}

output "token_role_attachment_role" {
  value = try(consul_acl_token_role_attachment.this.*.role)
}
