module "resource_group" {
    source = "../../modules/resource_group"
    rgs = var.rgs


module "virtual_network" {
  source = "../../modules/virtual_network"
  depends_on = [ module.resource_group ]
  virtual_network = {
  virtualnetwork1 = {
    name                = "vnet-demo"
    location            = "eastus"
    resource_group_name = "rg-terraform"
    address_space       = ["10.0.0.0/16"]
  }
}
}

module "subnet" {
    source = "../../modules/subnet"
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
}

module "vm" {
    source = "../../modules/vm"
    vms = {
    vm1 = {
        nic_name = "frontend-vm-nic"
        location = "centralindia"
        rg_name = "rg-chor"
        nic_subnet_name = "frontend-subnet"
        nic_vnet_name = "vnet-chor"
        nic_pip_name = "pip-chor-frontend-vm"
        vm_name = "frontend-vm"
        vm_size = "standard"
        admin_username = "devopsadmin"
        admin_password = "devops@123"
    }
  }
