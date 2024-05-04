# spot-sev-tf

Terraform script to deploy the Spot 7 LOG3900 project backend.

## Prerequisites
- Terraform
- Access to the STEP infrastructure (ask Faneva) or any other infrastructure that supports terraform  
- Gitlab access token  

## How to use this script ?
This script needs to be run before the [ansible script](https://gitlab.com/polytechnique-montr-al/log3900/24-1/equipe-103/spot-sev-ansible).

First you need to create a `terraform.tfvars` file in the `spot-sev-tf` folder. This file needs to contain the following variables : 
```terraform
# The key pair that you want to use to connect to the virtual machine
key_pair = "your_key_pair_name"
``` 
Then you need to init  terraform script. For that, you need your gitlab access token in a `.env` file, use the .env.example file as a template.  
Then you need to run the following commands : 
```bash
init.sh
```
After that, you can either use `terraform apply` or `terraform destroy` to deploy or destroy the infrastructure.``