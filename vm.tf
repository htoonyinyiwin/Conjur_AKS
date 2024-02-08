resource "azurerm_linux_virtual_machine" "rhelvm" {
  name                = "conjurRHELVM"
  resource_group_name = azurerm_resource_group.conjur-rg.name
  location            = azurerm_resource_group.conjur-rg.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8.7" 
    version   = "latest"
  }
}
