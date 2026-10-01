resource "azurerm_virtual_network" "ali_vnet" {
  name                = "vnet-ali"
  location            = var.location
  resource_group_name = "rg-ali-terraform"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "ali_subnet" {
  name                 = "subnet-ali"
  resource_group_name  = "rg-ali-terraform"
  virtual_network_name = azurerm_virtual_network.ali_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "ali_nic" {
  name                = "nic-ali"
  location            = var.location
  resource_group_name = "rg-ali-terraform"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ali_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "ali_vm" {
  name                = "vm-ali"
  resource_group_name = "rg-ali-terraform"
  location            = var.location
  size                = "Standard_B2s"
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.ali_nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
