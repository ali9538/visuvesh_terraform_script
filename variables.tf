variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}
variable "ssh_public_key" {
  description = "SSH public key for the virtual machine"
  type        = string
}
