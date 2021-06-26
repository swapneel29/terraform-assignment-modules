resource "aws_instance" "i1" {
    ami=var.ami_id
    instance_type=var.type
    key_name=var.pemfile
    vpc_security_group_ids = var.securitygroup-id
    subnet_id = var.subnet1-id
    associate_public_ip_address = true

       tags = {
        Name = "Web Server - Assignment2"
    }
  
}
