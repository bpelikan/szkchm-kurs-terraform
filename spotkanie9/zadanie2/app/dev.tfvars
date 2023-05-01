environment        = "dev"
vnet_address_space = "10.1.0.0/16"
rg_name            = "chm-student22-a"
shared_rg_name     = "chm-student22"
sub_id_app         = "790cebac-b0c8-49ec-99ce-4651daa94879"
sub_id_shared      = "6734621b-0b1a-48d2-9826-ddb7aeed2846"
shared_state_config = {
    resource_group_name  = "chm-student22"
    storage_account_name = "chmstudent22tfstate"
    container_name       = "tfstate"
    key                  = "shared.terraform.tfstate"
    subscription_id      = "6734621b-0b1a-48d2-9826-ddb7aeed2846"
}
