output "security-group-id" {
    value=aws_security_group.sg1.id
  
}

output "subnet-id" {
    value=aws_subnet.publicsn1-1a.id
}