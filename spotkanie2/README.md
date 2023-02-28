# [Spotkanie 2](https://github.com/cloudstateu/kurs-iac-terraform/blob/master/Zjazd2/zadania.md)


## [Zadanie 2.1](./zadanie1)

Wykorzystanie zmiennych
1. Utworzenie pliku `data.tf` z odwołaniem do `azurerm_resource_group`
2. Utworzenie pliku z definicjami zmiennych `variables.tf` + zmienne lokalne
3. Utworzenie pliku `network.tf` z zasobami vnet+subnet (`azurerm_virtual_network`, `azurerm_subnet`)
4. Utworzenie pliku z wartościami zmiennych `terraform.tfvars`
5. Przetestowanie działania przekazywania wartości zmiennych za pomocą zmiennych środowiskowych
    ```bash
    export TF_VAR_subnet_name='subnet02var'
    echo $TF_VAR_subnet_name
    unset TF_VAR_subnet_name
    ```

- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
- https://developer.hashicorp.com/terraform/language/values/variables
- https://developer.hashicorp.com/terraform/language/values/variables#variable-definition-precedence


## [Zadanie 2.2](./zadanie2)

1. Wykorzystanie środowiska z Key Vaultem ze [spotkania 1](../spotkanie1/zadanie2/)
2. Utworzenie zmiennej lokalnej `passwords` typu `map(string)` w `variables.tf`
3. Wykorzystanie pętli `for_each` do utworzenia secretów `azurerm_key_vault_secret` na podstawie wartości zmiennej `passwords`


- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
- https://developer.hashicorp.com/terraform/language/meta-arguments/for_each