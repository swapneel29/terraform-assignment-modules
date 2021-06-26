resource "aws_instance" "i1" {
    ami=var.ami_id
    instance_type=var.type
    key_name=var.pemfile
    vpc_security_group_ids = var.securitygroup-id
    subnet_id = var.subnet1-id
    associate_public_ip_address = true
    count=2

       tags = {
        Name = "Web Server - Assignment2"
    }

provisioner "remote-exec" {
    inline=[
      "sudo apt-get install -y python3"
    ]

connection{
    type="ssh"
    user="ubuntu"
    private_key=file ("devops1.pem")
    host=self.public_ip
}
}
provisioner "local-exec" {
    command=
}    

}
