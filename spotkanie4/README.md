# [Spotkanie 4](https://github.com/cloudstateu/kurs-iac-terraform/blob/master/Zjazd4/zadania.md)


## [Zadanie 4.1](./zadanie1)

* Utworzenie sieci dla architektury Hub&Spoke.
    * Hub vnet
        * AzureFirewallManagementSubnet
        * AzureFirewallSubnet
    * Spoke vnet - Jumphost
        * Jumphost subnet
    * Spoke vnet - App
        * App subnet
* Utworzenie peeringu pomiędzy sieciami spoke <-> hub


## [Zadanie 4.2](./zadanie2)

* Publiczny adres IP dla maszyny Jumphost
* Network interface dla maszyny wirtualnej Jumphost
* Network Security Group dla podsieci Jumphost VM
* Przypisanie NSG do podsieci Jumphost VM
* VM ze skonfigurowanym logowaniem przy pomocy hasła
* Network Security Group dla podsieci Spoke App
* Przypisanie NSG do podsieci Spoke App


## [Zadanie 4.3](./zadanie3)

* Publiczny adres IP dla Azure Firewall
* Publiczny adres IP dla Azure Firewall Management
* Azure Firewall Policy z sku Basic
* Azure Firewall Policy Rule Collection Group
* Azure Firewall z sku Basic


## [Zadanie 4.4](./zadanie4)

* Azure Log Analytics Workspace
* Azure Container App Environment
* Azure Container App
