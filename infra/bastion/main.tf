# bastion

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "seoul-sre-skc5-state"
    key    = "bastion.tfstate"
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = "ap-northeast-2"
}

module "bastion" {
  source = "./modules/bastion"

  region = "ap-northeast-2"
  city   = "SEOUL"
  stage  = "SRE"
  name   = "SKC5"
  suffix = "BASTION"

  vpc_id = "vpc-0dd816cc3ad0a97d4"

  subnet_id = "subnet-0c4fa2402902d70f3"

  # ami_id = ""
  type = "t2.micro"

  key_name = "SEOUL-SRE-K8S-BASTION"

  allow_ip_address = [
    "58.151.93.9/32", # 강남 echo "$(curl -sL icanhazip.com)/32"
    "58.151.93.17/32",
    "110.70.55.191/32"
  ]
}

output "name" {
  value = module.bastion.name
}

output "key_name" {
  value = module.bastion.key_name
}

output "public_ip" {
  value = module.bastion.public_ip
}
