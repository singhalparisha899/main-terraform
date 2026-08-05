virtual_network = {
  virtualnetwork1 = {
    name                = "vnet-demo"
    location            = "eastus"
    resource_group_name = "rg-terraform"
    address_space       = ["10.0.0.0/16"]
  }
}



