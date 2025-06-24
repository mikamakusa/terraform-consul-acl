data "consul_acl_auth_method" "this" {
  count = var.auth_method_name ? 1 : 0
  name  = var.auth_method_name
}

data "consul_acl_policy" "this" {
  count = var.policy_name ? 1 : 0
  name  = var.policy_name
}

data "consul_acl_role" "this" {
  count = var.role_name ? 1 : 0
  name  = var.role_name
}

data "consul_acl_token" "this" {
  count       = var.accessor_id ? 1 : 0
  accessor_id = var.accessor_id
}