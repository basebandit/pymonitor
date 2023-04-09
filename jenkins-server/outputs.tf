output "ec2_public_ip" {
  value = aws_instance.sysmon-server.public_ip
}

output "tf_state_bucket" {
  value = aws_s3_bucket.sysmon_tfstate_bucket.id
}
