# [Spotkanie 3](https://github.com/cloudstateu/kurs-iac-terraform/blob/master/Zjazd3/zadania.md)


## [Zadanie 3.1](./zadanie1)

1. Wykorzystanie środowiska z Key Vaultem ze [spotkania 1](../spotkanie1/zadanie2/)
2. Utworzenie zmiennej lokalnej `passwords` typu `list(string)` w `variables.tf`
    ```tf
    locals {
        passwords = [
            "secretvalue123",
            "secretvalue123-a",
            "secretvalue321",
            "secretvalue321-b"
        ]
    }
    ```
3. Wykorzystanie pętli `count` do utworzenia sekretów `azurerm_key_vault_secret` na podstawie wartości zmiennej `passwords`
4. Weryfikacja zachowania po dodaniu nowego sekretu

* [azurerm_key_vault_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret)
* [The count Meta-Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/count)

## [Zadanie 3.2](./zadanie2)

1. Utworznie `Storage Account` w portalu Azure
2. Utworzenie reprezentacji zasobu `Storage Account` w pliku `sa.tf`
3. Zaimportowanie zasobu za pomocą komendy `terraform import`
    ```bash
    terraform import azurerm_storage_account.storage_account_01 /subscriptions/e0a3aa17-0bd9-4dc5-803d-6ea393ade30a/resourceGroups/chm-student22/providers/Microsoft.Storage/storageAccounts/tfimportdemobp0204
    ```
4. Weryfikacja pliku stanu
5. Weryfikacja planu po wykonaniu `terraform plan`
   
* [azurerm_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account)
* [Command: import](https://developer.hashicorp.com/terraform/cli/commands/import)
