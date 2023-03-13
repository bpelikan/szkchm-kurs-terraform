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



---


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