provider "consul" {}

module "acl" {
  source = "../../"
  auth_method = [
    {
      id          = 0
      name        = "minikube"
      type        = "kubernetes"
      description = "dev minikube cluster"
      config_json = {
        Host              = "https://192.0.2.42:8443"
        CACert            = "-----BEGIN CERTIFICATE-----\n...-----END CERTIFICATE-----\n"
        ServiceAccountJWT = "eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9..."
      }
    }
  ]
  binding_rule = [
    {
      id             = 0
      auth_method_id = 0
      description    = "foobar"
      selector       = "serviceaccount.namespace==default"
      bind_type      = "service"
      bind_name      = "minikube"
    }
  ]
}