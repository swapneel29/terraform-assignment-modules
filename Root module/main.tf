provider "aws" {
    region="ap-south-1"
}

module "vpc"{
    source="./modules/vpc"
}

module "ec2"{
    source="./modules/ec2"
    pemfile="devops1"
    subnet1-id=module.vpc.subnet-id
    securitygroup-id=module.vpc.security-group-id
}

