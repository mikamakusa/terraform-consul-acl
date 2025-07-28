## RESOURCES

variable "auth_method" {
  type = list(object({
    id             = any
    name           = string
    type           = string
    config_json    = optional(map(string))
    description    = optional(string)
    display_name   = optional(string)
    max_token_ttl  = optional(string)
    namespace      = optional(string)
    partition      = optional(string)
    token_locality = optional(string)
    namespace_rule = optional(list(object({
      bind_namespace = string
      selector       = optional(string)
    })), [])
  }))
  default = []
}

variable "binding_rule" {
  type = list(object({
    id             = any
    auth_method_id = any
    bind_name      = string
    bind_type      = string
    description    = optional(string)
    namespace      = optional(string)
    partition      = optional(string)
    selector       = optional(string)
    bind_vars = optional(list(object({
      name = optional(string)
    })), [])
  }))
  default = []
}

variable "policy" {
  type = list(object({
    id          = any
    name        = string
    rules       = string
    description = optional(string)
    datacenters = optional(list(string))
    namespace   = optional(string)
    partition   = optional(string)
  }))
  default = []
}

variable "role" {
  type = list(object({
    id          = any
    name        = string
    description = optional(string)
    namespace   = optional(string)
    partition   = optional(string)
    policies_id = optional(list(number))
    node_identities = optional(list(object({
      datacenter = string
      node_name  = string
    })), [])
    service_identities = optional(list(object({
      service_name = string
      datacenters  = optional(list(string))
    })), [])
    templated_policies = optional(list(object({
      template_name = string
      datacenters   = optional(list(string))
      template_variables = optional(list(object({
        name = optional(string)
      })), [])
    })), [])
  }))
  default = []
}

variable "role_policy_attachment" {
  type = list(object({
    id        = any
    policy_id = any
    role_id   = any
  }))
  default = []
}

variable "token" {
  type = list(object({
    id              = any
    accessor_id     = optional(string)
    description     = optional(string)
    expiration_time = optional(string)
    local           = optional(bool)
    namespace       = optional(string)
    partition       = optional(string)
    policies_id     = optional(list(any))
    roles_id        = optional(list(any))
    node_identities = optional(list(object({
      datacenter = string
      node_name  = string
    })), [])
    service_identities = optional(list(object({
      service_name = string
      datacenters  = optional(list(string))
    })), [])
    templated_policies = optional(list(object({
      template_name = string
      datacenters   = optional(list(string))
      template_variables = optional(list(object({
        name = optional(string)
      })), [])
    })), [])
  }))
  default = []
}

variable "token_policy_attachment" {
  type = list(object({
    id        = any
    policy_id = any
    token_id  = any
  }))
  default = []
}

variable "token_role_attachment" {
  type = list(object({
    id       = any
    role_id  = any
    token_id = any
  }))
  default = []
}
