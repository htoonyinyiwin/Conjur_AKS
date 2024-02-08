terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.1"
    }
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "conjur-rg" {
  name     = "conjur-resources"
  location = "Southeast Asia"
  tags = {
    environment = "dev"
  }
}

#................................AKS Clusters.....................................
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "ConjurAKS"
  location            = azurerm_resource_group.conjur-rg.location
  resource_group_name = azurerm_resource_group.conjur-rg.name
  dns_prefix          = "conjuraks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

#................................AKS.....................................
#................................AKS.....................................
#................................AKS.....................................
