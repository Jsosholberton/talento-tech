init:
	@echo "terraform init"
	cd terraform && terraform init

plan:
	@echo "terraform plan"
	cd terraform && terraform plan

apply:
	@echo "Starting Terraform apply process..."
	cd terraform && terraform apply

destroy:
	@echo "terraform destroy"
	cd terraform && terraform destroy

validate:
	@echo "terraform validate"
	cd terraform && terraform validate

change_development:
	@echo "Changing to development"
	cd terraform && terraform workspace select development

change_production:
	@echo "Changing to production"
	cd terraform && terraform workspace select production

pkg:
	@echo "Creating package..."
	powershell -Command "Compress-Archive -Path src/* -DestinationPath dist/package.zip -Force"