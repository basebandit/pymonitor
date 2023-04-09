variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "availability_zone" {}
variable "env_prefix" {}
variable "instance_type" {}
variable "ssh_key_name" {}
variable "private_key_path" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {}
variable "s3_tfstate_bucket" {
  type = object({
    bucket = string
  })
}