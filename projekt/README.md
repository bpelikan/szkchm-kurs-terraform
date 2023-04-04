# Hub & Spoke

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
terraform init -backend-config=./prod.tfbackend -reconfigure
terraform destroy --auto-approve -var-file=prod.tfvars

terraform init -backend-config=./dev.tfbackend -reconfigure
terraform destroy --auto-approve -var-file=dev.tfvars

cd ../shared
terraform destroy --auto-approve
```