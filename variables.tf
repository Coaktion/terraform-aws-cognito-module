variable "pools" {
  description = "A list of user pools to create"
  type = list(object({
    name              = string
    delete_protection = optional(bool, true)

    password_policy = optional(object({
      minimum_length                   = optional(number)
      require_lowercase                = optional(bool)
      require_numbers                  = optional(bool)
      require_symbols                  = optional(bool)
      require_uppercase                = optional(bool)
      temporary_password_validity_days = optional(number)
    }), {})

    email_configuration = optional(object({
      configuration_set      = optional(string)
      email_sending_account  = optional(string)
      from_email_address     = optional(string)
      reply_to_email_address = optional(string)
      source_arn             = optional(string)
    }), {})

    admin_create_user_config = optional(object({
      allow_admin_create_user_only = optional(bool)
    }), {})
  }))
}
