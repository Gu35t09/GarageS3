# Generic proxmox variables
variable "proxmox_api_token_id" {
  description = "The ID of the API token used for authentication with the Proxmox API."
  type        = string
}

variable "proxmox_api_token_secret" {
  description = "The secret value of the token used for authentication with the Proxmox API."
  type        = string
}

variable "proxmox_api_url" {
  description = "The URL for the Proxmox API."
  type        = string
}


# Node name variables
variable "node_name" {
  description = "The node where to deploy the VM"
  type = string
}


# ISO related variables
variable "iso_datastore_id" {
  description = "Proxmox datastore where to save the ISO"
  type = string
  default = "local"
}

variable "iso_file_name" {
  description = "The name to save the ISO as"
  type = string
}

variable "iso_download_url" {
  description = "The URL from where to download the ISO"
  type = string
}

# VM related variables
variable "vm_id" {
  description = "The VMID the virtual machine will have"
  type = number
}

variable "vm_name" {
  description = "The name of the VM"
  type = string
}

variable "vm_ram" {
  description = "Memory assigned to the VM"
  type = number
  default = 2048
}

variable "vm_core" {
  description = "Number of core to assign to the VM"
  type = number
  default = 2
}

variable "vm_datastore" {
  description = "The Proxmox datastore to use for VM"
  type = string
  default = "local-lvm"
}

variable "vm_disk_size" {
  description = "Disk size of VM"
  type = number
  default = 30
}

variable "vm_network_bridge" {
  description = "The Proxmox bridge to assign to the VM"
  type = string
  default = "vmbr0"
}




