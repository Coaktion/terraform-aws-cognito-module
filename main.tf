resource "aws_cognito_user_pool" "this" {
  for_each = tomap({ for pool in var.pools : pool.name => pool })

  name = each.value.name

  password_policy {
    minimum_length                   = each.value.password_policy.minimum_length
    require_lowercase                = each.value.password_policy.require_lowercase
    require_numbers                  = each.value.password_policy.require_numbers
    require_symbols                  = each.value.password_policy.require_symbols
    require_uppercase                = each.value.password_policy.require_uppercase
    temporary_password_validity_days = each.value.password_policy.temporary_password_validity_days
  }

  email_configuration {
    configuration_set      = each.value.email_configuration.configuration_set
    email_sending_account  = each.value.email_configuration.email_sending_account
    from_email_address     = each.value.email_configuration.from_email_address
    reply_to_email_address = each.value.email_configuration.reply_to_email_address
    source_arn             = each.value.email_configuration.source_arn
  }

  admin_create_user_config {
    allow_admin_create_user_only = each.value.admin_create_user_config.allow_admin_create_user_only
  }
}
