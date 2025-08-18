<h1>OpenTofu + Ansible playbook to deploy Garage S3 Object Storage on Proxmox V</h1>

<h2>Overview</h2>

This repo contains a Terraform/OpenTofu script to deploy a single debian VM on Proxmox and an Ansible Playbook to then configure the OS and Garage Object Storage.

> Always use the latest version of the terraform providers if possible
> - https://search.opentofu.org/provider/bpg/proxmox/latest


Table of content:
    - [Usage](#usage)


## Usage

<h3>1 - Populate required variables</h3>

The first thing to do is create a file named `secrets.auto.tfvars` and inside it define three variables:

```
proxmox_api_url = "https://proxmox_url:8006"
proxmox_api_token_id = "" # API user token create on proxmox (see below)
proxmox_api_token_secret = ""  # API user secret 
```
 > Refer to the ufficial provider documentatio for API user creation on Proxmox: https://search.opentofu.org/provider/bpg/proxmox/latest

 > Ensure to properly configure .gitignore to excluse sensitive information. Refer to [this](https://github.com/github/gitignore/blob/main/Terraform.gitignore) example.

Populate `terraform.tfvars` with the required variable (refer to `var-declaration.tf` for a complete list of declared variables).


<h3>2 - Run the OpenTofu script</h3>

Initialize the Terraform enviroment:
 ```
 tofu init
 ``` 
 
This will download the required provider listed in the `providers.tf` file.

Dry-run the script execution:
```
tofu plan
```

Execute the script:
```
tofu apply
```
