locals {
  path = var.path == "" ? "/${var.namespace}/${var.stage}/${var.name}" : var.path
}

module "info" {
  source  = "Selleo/context/null"
  version = "0.3.0"
  
  namespace = var.namespace
  stage     = var.stage
  name      = var.name
}

module "secrets" {
  source = "../../modules/editable-parameters"

  context = module.info.context
  path    = local.path

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
