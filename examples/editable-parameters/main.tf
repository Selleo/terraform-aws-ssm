module "info" {
  source  = "Selleo/context/null"
  version = "0.3.0"
  
  namespace = "example"
  stage     = "test"
  name      = "ssm"
}

module "secrets" {
  source = "../../modules/editable-parameters"

  secrets = {
    RAILS_ENV       = module.info.context.stage
    PORT            = "3000"
    SECRET_KEY_BASE = random_id.secret_key_base.hex
    DATABASE_URL    = "url"
    DOMAIN          = "lvh.me"
  }
}

resource "random_id" "secret_key_base" {
  byte_length = 32
}

output "secrets" {
  value = module.secrets.secrets
}
