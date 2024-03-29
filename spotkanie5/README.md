# [Spotkanie 5](https://github.com/cloudstateu/kurs-iac-terraform/blob/master/Zjazd5/zadania.md)


## [Zadanie 5.1](./zadanie1)

* Ręczne utworzenie storage account
* Konfiguracja backendu `terraform.tfbackend` korzystająca z utworzonego storage account
    ```bash
    terraform init -backend-config=./terraform.tfbackend
    ```


## [Zadanie 5.2](./zadanie2)

* Przygotowanie sieci Hub & Spoke

```bash
cd shared
terraform init -backend-config=./shared.tfbackend
terraform apply --auto-approve

cd ../app
terraform init -backend-config=./dev.tfbackend -reconfigure
terraform apply --auto-approve -var-file=dev.tfvars

terraform init -backend-config=./prod.tfbackend -reconfigure
terraform apply --auto-approve -var-file=prod.tfvars

```

```bash
terraform destroy --auto-approve -var-file=prod.tfvars

terraform init -backend-config=./dev.tfbackend -reconfigure
terraform destroy --auto-approve -var-file=dev.tfvars

cd ../shared
terraform destroy --auto-approve
```


## [Zadanie 5.3](./zadanie3)

* Utworzenie Azure Key Vault


## [Zadanie 5.4](./zadanie4)

* Utworzenie Azure Container Registry


## [Zadanie 5.5](./zadanie5)

* Utworzenie Storage Account


## [Zadanie 5.6](./zadanie6)

* Private DNS Zones
* Private Endpoints