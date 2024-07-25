terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.64.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# criacao resource group
resource "azurerm_resource_group" "default" {
    name = "rg-challenge"
    location = var.locat
}


resource "azurerm_virtual_network" "default" {
  name                = "vnet-challenge"
  address_space       = ["10.0.0.0/16"]
  location            = var.locat
  resource_group_name = var.rg
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = var.rg
  virtual_network_name = var.vnet
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [
    azurerm_virtual_network.default
  ]
}


resource "azurerm_public_ip" "public" {
  name                = "${var.vm}-publicip"
  location            = var.locat
  resource_group_name = var.rg
  allocation_method   = "Static"
}

# Create network interface
resource "azurerm_network_interface" "default" {
  name                = "${var.vm}-nic"
  location            = var.locat
  resource_group_name = var.rg

  ip_configuration {
    name                          = "${var.vm}-ipconf"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public.id
  }
}

# Create virtual machine linux
resource "azurerm_virtual_machine" "main" {
  name                  = var.vm
  location              = var.locat
  resource_group_name   = var.rg
  network_interface_ids = [azurerm_network_interface.default.id]
  vm_size               = "Standard_B1s"
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name                 = "${var.vm}-osdisk"
    caching              = "ReadWrite"
    create_option        = "FromImage"
    managed_disk_type    = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm
    admin_username = var.admin_username
    admin_password = var.admin_password
    # script de inicialização
    custom_data = filebase64("${path.module}/install_docker.sh")
  }
  # Profile do Linux
  os_profile_linux_config {
    disable_password_authentication = false
  }

}