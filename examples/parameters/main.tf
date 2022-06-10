module "info" {
  source  = "Selleo/context/null"
  version = "0.2.0"

  namespace = "selleo"
  stage     = "production"
  name      = "kudos-api"
}

module "secrets" {
  source = "../../modules/parameters"

  context = module.info.context
  path    = module.info.path

  secrets = {
    RAILS_ENV       = module.info.context.stage
    PORT            = "3000"
    SECRET_KEY_BASE = random_id.secret_key_base.hex
    DATABASE_URL    = module.rds.database_url
    DOMAIN          = "lvh.me"
  }
}

resource "random_id" "secret_key_base" {
  byte_length = 32
}

output "secrets" {
  value = module.secrets.secrets
}
