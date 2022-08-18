variable "ami_id" {
  description = "The ami ID to use in this module"
}
variable "inst_type" {
  description = "The instance type"
}
variable "security_id" {
  description = "The security ID"
}
variable "subnet_ids" {
  description = "The subnet CIDR value"
}
variable "ec2_name" {
  description  =  "The name of the EC2"
}
variable "key_pair" {
  description = "key pair name"
}
# variable "is_public" {
#   default = false
#   description = "Subnet is public or private True or False"
# }