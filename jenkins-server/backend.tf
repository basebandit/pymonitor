terraform {
  backend "s3" {
    bucket = "sysmon-app-bucket"
    region = "us-east-1"
    key    = "jenkins-server/terraform.tfstate"
  }
}
