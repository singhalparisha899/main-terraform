pip = {
  pip1 = {
    name                = "pip-frontend-vm"
    resource_group_name = "rg-terraform"
    location            = "eastus"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "pip-backend-vm"
    resource_group_name = "rg-terraform"
    location            = "eastus"
    allocation_method   = "Static"
  }
}