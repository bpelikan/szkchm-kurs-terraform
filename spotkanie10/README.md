# [Spotkanie 10](https://github.com/cloudstateu/kurs-iac-terraform/blob/master/Zjazd10/zadania.md)


## [Zadanie 10.1](./zadanie1)

* Utworzenie jumphosta i zainstalowanie narzędzi:
    * Azure CLI
    * Kubectl
    * Helm


## [Zadanie 10.2](./zadanie2)

* Link do strefy DNS wykorzystywanej przez AKS do sieci `Shared`
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


## Zadanie 10.6

* Połaczenie się z AKS przez jumphosta
    ```bash
    AKS_SUBSCRIPTION_ID="790cebac-b0c8-49ec-99ce-4651daa94879"
    AKS_RESOURCE_GROUP_NAME="chm-student22-a"
    AKS_NAME="chms22-dev-lab-aks"
    az account set -s $AKS_SUBSCRIPTION_ID
    az aks get-credentials --resource-group $AKS_RESOURCE_GROUP_NAME --name $AKS_NAME
    ```

* Wdrożenie aplikacji na klaster AKS
    ```bash
    TENANT_ID="3a81269f-0731-42d7-9911-a8e9202fa750"
    ACR_NAME="chms22srdlabacr"
    KEY_VAULT_NAME="chms22-dev-lab-kv4"
    USER_NAME="00000000-0000-0000-0000-000000000000"
    ACR_SUBSCRIPTION_ID="6734621b-0b1a-48d2-9826-ddb7aeed2846"
    SECRET_PROVIDER_CLIENT_ID="c00c8188-e679-493d-949f-9e1315a019dd" # do pobrania z outputów modułu aks w zadaniu 3

    az account set -s $ACR_SUBSCRIPTION_ID

    PASSWORD=$(az acr login --name $ACR_NAME --expose-token --output tsv --query accessToken)
    helm registry login $ACR_NAME.azurecr.io \
    --username $USER_NAME \
    --password $PASSWORD

    helm pull oci://$ACR_NAME.azurecr.io/helm/dawidholka/chm-status

    helm upgrade --install chm-status chm-status-0.1.0.tgz --install \
    --set image.repository=$ACR_NAME.azurecr.io/dawidholka/chm-status \
    --set config.APP_ENV="production" \
    --set config.APP_DEBUG="false" \
    --set secrets.KEY_VAULT_URI=$KEY_VAULT_NAME \
    --set secrets.TENANT_ID=$TENANT_ID \
    --set secrets.SECRET_PROVIDER_CLIENT_ID=$SECRET_PROVIDER_CLIENT_ID
    ```
