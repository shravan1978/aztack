# variable "master-ips" { default = "10.0.1.10,10.0.1.11,10.0.1.12" }
# variable "master-ips" {
#   default = "10.0.1.10"
# }

variable "master-ips" {}
variable "name" {}
variable "location" {}
variable "private-subnet-id" {}
variable "instances" {}
variable "depends-id" {}

output "depends-id" {
  value = "${null_resource.dummy_dependency.id}"
}
