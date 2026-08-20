subnet = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-terraform"
    virtual_network_name = "vnet-demo"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-terraform"
    virtual_network_name = "vnet-demo"
    address_prefixes     = ["10.0.2.0/24"]
  }
}