# [Kurs Terraform](https://portal.szkolachmury.pl/products/terraform-praktyczny-kurs-iac)

* [Spotkanie 1](./spotkanie1/)
   * Konfiguracja providerów
   * Key Vault
* [Spotkanie 2](./spotkanie2/)
   * Zmienne
   * Pętla `for_each`
   * VNET + subnet
* [Spotkanie 3](./spotkanie3/)
   * Pętla `count`
   * Importowanie zasobów do pliku stanu
* [Spotkanie 4](./spotkanie4/)
   * Hub & Spoke
   * VM jumphost
   * Azure Firewall
   * Container Apps
   * DNS
   * Route Table
* [Spotkanie 5](./spotkanie5/)
   * Konfiguracja backendu `terraform.tfbackend` korzystająca z utworzonego storage account
   * Przygotowanie sieci Hub & Spoke
   * Utworzenie:
      * Azure Key Vault
      * Azure Container Registry
      * Storage Account
   * Private DNS Zones
   * Private Endpoints

* [Spotkanie 6](./spotkanie6/)
   * Utworzenie:
      * Redis Cache
      * PostgreSQL Flexible Server
      * Log Analytics Workspace
      * AKS

* [Spotkanie 7](./spotkanie7/)
   * Dodanie aliasów dla providerów i zasobów
   * Przeniesienie zasobów tworzących sieć spoke do modułu

* [Spotkanie 8](./spotkanie8/)
   * Dodanie aliasów dla providerów i zasobów
   * Przeniesienie Key Vaulta do modułu
   * Przeniesienie AKS do modułu

* [Spotkanie 9](./spotkanie9/)
   * Zaktualizowanie wersji Terraforma
   * Zaktualizowanie wersji providerów
   * Zastąpienie przestarzałych parametrów
   * Wykorzystanie data `terraform_remote_state` do pobierania danych zasobów Shared
   * Przeniesienie bazy PostgreSQL do modułu


* [Spotkanie 10](./spotkanie10/)
   * Utworzenie jumphosta i zainstalowanie narzędzi:
      * Azure CLI
      * Kubectl
      * Helm
   * Link do strefy DNS wykorzystywanej przez AKS do sieci `Shared`
   * Wyłączenie publicznego dostępu do usługi Azure Container Registry
   * Ograniczenie dostępu do Key Vault
   * Wyłączenie publicznego dostępu do usługi Azure Cache for Redis
   * Integracja AKS z Key Vault
   * Utworzenie sekretów w Key Vault
   * Import obrazu i helm do ACR wykorzystując jumphosta
   * Połaczenie się z AKS przez jumphosta
   * Wdrożenie aplikacji na klaster AKS

---

## Terraform commands

```bash
terraform init
terraform validate
terraform plan

terraform apply
terraform apply -auto-approve

terraform destroy 
terraform destroy -auto-approve


# formatowanie
terraform fmt


# state
terraform state show
terraform state list
terraform rm
terraform state import

terraform init -upgrade
```

## Azure CLI commands

```
az upgrade

az login

az account list --output table
az account set --subscription sandbox
az account set --subscription "SUB_ID"

az account list \
   --refresh \
   --query "[?contains(name, 'SUB_NAME')].id" \
   --output table

az configure --defaults group=RG_NAME
```