resource "azurerm_virtual_network" "vnet" {
  name                = "conjurVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.conjur-rg.location
  resource_group_name = azurerm_resource_group.conjur-rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "conjurSubnet"
  resource_group_name  = azurerm_resource_group.conjur-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "conjurVMNic"
  location            = azurerm_resource_group.conjur-rg.location
  resource_group_name = azurerm_resource_group.conjur-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
