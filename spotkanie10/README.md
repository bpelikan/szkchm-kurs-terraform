# [Spotkanie 10](https://github.com/cloudstateu/kurs-iac-terraform/blob/master/Zjazd10/zadania.md)


## [Zadanie 10.1](./zadanie1)

* Utworzenie jumphosta i zainstalowanie narzędzi:
    * Azure CLI
    * Kubectl
    * Helm


## [Zadanie 10.2](./zadanie2)

* Link strefy DNS wykorzystywanej przez AKS do sieci `Shared`
* Wyłączenie publicznego dostępu do usługi Azure Container Registry
* Ograniczenie dostępu do Key Vault
* Wyłączenie publicznego dostępu do usługi Azure Cache for Redis


## [Zadanie 10.3](./zadanie3)

* Integracja AKS z Key Vault


## [Zadanie 10.4](./zadanie4)

* Utworzenie sekretów w Key Vault


## Zadanie 10.5

* Import obrazu i helm do ACR wykorzystując jumphosta
    ```bash
    ACR_SUBSCRIPTION_ID="6734621b-0b1a-48d2-9826-ddb7aeed2846"
    ACR_NAME="chms22srdlabacr"
    az login # zaloguj się do Azure 
    az account set -s $ACR_SUBSCRIPTION_ID # wybierz subskrypcję na której jest ACR
    az acr import --name $ACR_NAME --source docker.io/dawidholka/chm-status:1.0.0
    az acr import --name $ACR_NAME -t helm/dawidholka/chm-status:0.1.0 --source registry-1.docker.io/dawidholka/chm-status:0.1.0
    ```

