environment        = "prod"
vnet_address_space = "10.2.0.0/16"
rg_name            = "chm-student22"
shared_rg_name     = "chm-student22"
sub_id_app         = "6734621b-0b1a-48d2-9826-ddb7aeed2846"
sub_id_shared      = "6734621b-0b1a-48d2-9826-ddb7aeed2846"
shared_state_config = {
  resource_group_name  = "chm-student22"
  storage_account_name = "chmstudent22tfstate"
  container_name       = "tfstate"
  key                  = "shared.terraform.tfstate"
  subscription_id      = "6734621b-0b1a-48d2-9826-ddb7aeed2846"
}
