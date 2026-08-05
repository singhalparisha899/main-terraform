resource "azurerm_network_interface" "nic" {
    for each = var.nic
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.public_ip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }

  resource "azurerm_virtual_machine" "virtual_machine" {
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  size               = each.value.vm_size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false

  network_interface_ids = azurerm_network_interface.nic[each.key.].id

  os disk {
    caching = "readwrite
    storage_account_type = "standard_lrs"
  }

  source_image_reference = {
    publisher = "canonical"
    offer = "001"
    sku = "22"
    version = "latest"
 }