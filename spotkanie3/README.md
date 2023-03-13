# [Spotkanie 3](https://github.com/cloudstateu/kurs-iac-terraform/blob/master/Zjazd3/zadania.md)


## [Zadanie 3.1](./zadanie1)


1. Wykorzystanie środowiska z Key Vaultem ze [spotkania 1](../spotkanie1/zadanie2/)
2. Utworzenie zmiennej lokalnej `passwords` z listą haseł w `variables.tf`
3. Wykorzystanie pętli `count` do utworzenia secretów `azurerm_key_vault_secret` na podstawie wartości zmiennej `passwords`