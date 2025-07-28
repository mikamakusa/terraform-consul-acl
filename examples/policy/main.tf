provider "consul" {}

module "policy" {
  source = "../../"
  role = [
    {
      id          = 2
      name        = "foo"
      description = "bar"
      policies_id = 3
      service_identities = [
        {
          service_name = "foo"
        }
      ]
    }
  ]
  policy = [
    {
      id          = 3
      name        = "my_policy"
      datacenters = ["dc1"]
      rules       = "node_prefix \"\" {policy = \"read\"}"
    }
  ]
  role_policy_attachment = [
    {
      id        = 4
      policy_id = 3
      role_id   = 2
    }
  ]
}