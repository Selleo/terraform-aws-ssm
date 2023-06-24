module "secrets" {
  source = "../../modules/parameters"

  context = {
    namespace = "selleo"
    stage     = "staging"
    name      = "api"
  }

  path = "/selleo/staging/api/terraform" # this is default based on context
  secrets = {
    RAILS_ENV       = "staging"
    PORT            = "3000"
    SECRET_KEY_BASE = random_id.secret_key_base.hex
    DOMAIN          = "lvh.me"
  }

  editable_path = "/selleo/staging/api/editable" # this is default based on context
  editable_secrets = {
    THIRD_PARTY_SECRET = "Edit via UI then restart the service, changes in terraform are ignored"
  }
}

resource "random_id" "secret_key_base" {
  byte_length = 32
}

output "secrets" {
  value = module.secrets.secrets
}

output "editable_secrets" {
  value = module.secrets.editable_secrets
}
