resource "consul_acl_auth_method" "this" {
  count          = length(var.auth_method)
  name           = lookup(var.auth_method[count.index], "name")
  type           = lookup(var.auth_method[count.index], "type")
  config_json    = jsonencode(lookup(var.auth_method[count.index], "config_json"))
  description    = lookup(var.auth_method[count.index], "description")
  display_name   = lookup(var.auth_method[count.index], "display_name")
  max_token_ttl  = lookup(var.auth_method[count.index], "max_token_ttl")
  namespace      = lookup(var.auth_method[count.index], "namespace")
  partition      = lookup(var.auth_method[count.index], "partition")
  token_locality = lookup(var.auth_method[count.index], "token_locality")

  dynamic "namespace_rule" {
    for_each = try(lookup(var.auth_method[count.index], "namespace_rule") == null ? [] : ["namespace_rule"])
    content {
      bind_namespace = lookup(namespace_rule.value, "bind_namespace")
      selector       = lookup(namespace_rule.value, "selector")
    }
  }
}

resource "consul_acl_binding_rule" "this" {
  count       = length(var.auth_method) == 0 ? 0 : length(var.binding_rule)
  auth_method = element(consul_acl_auth_method.this.*.name, lookup(var.binding_rule[count.index], "auth_method_id"))
  bind_name   = lookup(var.binding_rule[count.index], "bind_name")
  bind_type   = lookup(var.binding_rule[count.index], "bind_type")
  description = lookup(var.binding_rule[count.index], "description")
  namespace   = lookup(var.binding_rule[count.index], "namespace")
  partition   = lookup(var.binding_rule[count.index], "partition")
  selector    = lookup(var.binding_rule[count.index], "selector")

  dynamic "bind_vars" {
    for_each = try(lookup(var.binding_rule[count.index], "bind_vars") == null ? [] : ["bind_vars"])
    content {
      name = lookup(bind_vars.value, "name")
    }
  }
}

resource "consul_acl_policy" "this" {
  count       = length(var.policy)
  name        = lookup(var.policy[count.index], "name")
  rules       = format("<<-RULE %s RULE", lookup(var.policy[count.index], "rules"))
  description = lookup(var.policy[count.index], "description")
  datacenters = lookup(var.policy[count.index], "datacenters")
  namespace   = lookup(var.policy[count.index], "namespace")
  partition   = lookup(var.policy[count.index], "partition")
}

resource "consul_acl_role" "this" {
  count       = length(var.role)
  name        = lookup(var.role[count.index], "name")
  description = lookup(var.role[count.index], "description")
  namespace   = lookup(var.role[count.index], "namespace")
  partition   = lookup(var.role[count.index], "partition")
  policies    = [consul_acl_policy.this.*.id[lookup(var.role[count.index], "policies_id")]]

  dynamic "node_identities" {
    for_each = try(lookup(var.role[count.index], "node_identities") == null ? [] : ["node_identities"])
    content {
      datacenter = lookup(node_identities.value, "datacenter")
      node_name  = lookup(node_identities.value, "node_name")
    }
  }

  dynamic "service_identities" {
    for_each = try(lookup(var.role[count.index], "service_identities") == null ? [] : ["service_identities"])
    content {
      service_name = lookup(service_identities.value, "service_name")
      datacenters  = lookup(service_identities.value, "datacenters")
    }
  }

  dynamic "templated_policies" {
    for_each = try(lookup(var.role[count.index], "templated_policies") == null ? [] : ["templated_policies"])
    content {
      template_name = lookup(templated_policies.value, "template_name")
      datacenters   = lookup(templated_policies.value, "datacenters")

      dynamic "template_variables" {
        for_each = try(lookup(templated_policies.value, "template_variables") == null ? [] : ["template_variables"])
        content {
          name = lookup(template_variables.value, "name")
        }
      }
    }
  }
}

resource "consul_acl_role_policy_attachment" "this" {
  count   = length(var.role)  == 0 ? 0 : length(var.role_policy_attachment)
  policy  = element(consul_acl_policy.this.*.name, lookup(var.role_policy_attachment[count.index], "policy_id"))
  role_id = element(consul_acl_role.this.*.id, lookup(var.role_policy_attachment[count.index], "role_id"))
}

resource "consul_acl_token" "this" {
  count           = length(var.token)
  accessor_id     = lookup(var.token[count.index], "accessor_id")
  description     = lookup(var.token[count.index], "description")
  expiration_time = lookup(var.token[count.index], "expiration_time")
  local           = lookup(var.token[count.index], "local")
  namespace       = lookup(var.token[count.index], "namespace")
  partition       = lookup(var.token[count.index], "partition")
  policies        = consul_acl_policy.this.*.name[lookup(var.token[count.index], "policies_id")]
  roles           = consul_acl_role.this.*.name[lookup(var.token[count.index], "roles_id")]

  dynamic "node_identities" {
    for_each = try(lookup(var.token[count.index], "node_identities") == null ? [] : ["node_identities"])
    content {
      datacenter = lookup(node_identities.value, "datacenter")
      node_name  = lookup(node_identities.value, "node_name")
    }
  }

  dynamic "service_identities" {
    for_each = try(lookup(var.token[count.index], "service_identities") == null ? [] : ["service_identities"])
    content {
      service_name = lookup(service_identities.value, "service_name")
      datacenters  = lookup(service_identities.value, "datacenters")
    }
  }

  dynamic "templated_policies" {
    for_each = try(lookup(var.token[count.index], "templated_policies") == null ? [] : ["templated_policies"])
    content {
      template_name = lookup(templated_policies.value, "template_name")
      datacenters   = lookup(templated_policies.value, "datacenters")

      dynamic "template_variables" {
        for_each = try(lookup(templated_policies.value, "template_variables") == null ? [] : ["template_variables"])
        content {
          name = lookup(template_variables.value, "name")
        }
      }
    }
  }
}

resource "consul_acl_token_policy_attachment" "this" {
  count    = length(var.policy) == 0 ? 0 : length(var.token_policy_attachment)
  policy   = element(consul_acl_policy.this.*.name, lookup(var.token_policy_attachment[count.index], "policy_id"))
  token_id = element(consul_acl_token.this.*.id, lookup(var.token_policy_attachment[count.index], "token_id"))
}

resource "consul_acl_token_role_attachment" "this" {
  count    = length(var.role) == 0 ? 0 : length(var.token_role_attachment)
  role     = element(consul_acl_role.this.*.id, lookup(var.token_role_attachment[count.index], "role_id"))
  token_id = element(consul_acl_token.this.*.id, lookup(var.token_role_attachment[count.index], "token_id"))
}