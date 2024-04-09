provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

module "cognito" {
  source = "../"

  pools = [
    {
      name              = "example"
      delete_protection = false # Optional, default is true

      # password_policy = { # Optional
      #   minimum_length                   = 8
      #   require_lowercase                = true
      #   require_numbers                  = true
      #   require_symbols                  = true
      #   require_uppercase                = true
      #   temporary_password_validity_days = 7
      # }

      # email_configuration = { # Optional
      #   configuration_set      = "example"
      #   email_sending_account  = "example"
      #   from_email_address     = "example@email.com"
      #   reply_to_email_address = "example@email.com"
      #   source_arn             = "example"
      # }

      # admin_create_user_config = { # Optional
      #   allow_admin_create_user_only = true
      # }
    }
  ]
}
