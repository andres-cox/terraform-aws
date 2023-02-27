install:
	pip3 install checkov
	curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

analize:
	- terraform validate
	- tflint
	checkov --directory .

tflint:
	tflint

checkov:
	checkov --directory .

format:
	terraform fmt -recursive
	terraform validate
