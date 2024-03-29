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


## [Zadanie 4.5](./zadanie5)

* Prywatna strefa DNS pod Azure Container App
* Wpis wildcard typu A do prywatnej strefy DNS pod Azure Container App
* Podpięcie prywatnej strefy DNS pod sieć Jumphost
* Podpięcie prywatnej strefy DNS pod sieć App
* Podpięcie prywatnej strefy DNS pod sieć Hub


## [Zadanie 4.6](./zadanie6)

* Route Table dla podsieci Spoke App
* Route Table dla podsieci Jumphost VM
* Dowiązanie Route Table do podsieci Spoke App
* Dowiązanie Route Table do podsieci Jumphost VM

## Zadanie 4.7

* Zalogowanie się na utworzoną VM i odpytanie za pomocą `curl` aplikację wdrożoną na Azure Container Apps.