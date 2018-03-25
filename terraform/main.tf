# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "subscription_id-example"
  client_id       = "client_id-example"
  client_secret   = "client_secret-example"
  tenant_id       = "tenant_id-example"
}

module "rg" {
  source     = "./modules/rg"
  depends-id = ""

  # variables
  name     = "${ var.name }"
  location = "${ var.location }"
}

module "vnet" {
  source     = "./modules/vnet"
  depends-id = "${ module.rg.depends-id }"

  # variables
  name     = "${ var.name }"
  location = "${ var.location }"
  cidr     = "${ var.cidr }"
}

module "master" {
  source     = "./modules/master"
  depends-id = "${ module.vnet.depends-id }"

  # variables
  name       = "${ var.name }"
  location   = "${ var.location }"
  instances  = "${ length( split(",", var.master-ips) ) }"
  master-ips = "${ var.master-ips }"

  # modules
  private-subnet-id = "${ module.vnet.private-subnet-id }"
}
