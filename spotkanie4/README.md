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