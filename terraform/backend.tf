terraform {
  backend "azurerm" {
    storage_account_name = "satfbkp"
    container_name       = "statefiles"
    resource_group_name  = "sa_bkp-rg"
    key                  = "credpay.terraform.tfstate"
  }
}