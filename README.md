# terraform assignment
root-module-->'dynaomodb&s3'(folder)=contains main.tf to create dynamodb for locking the state file and s3 bucket .
               main.tf=contains provider block, modules vpc & ec2 to create desired infra.
               backend.tf=contains backend block to store state file in s3
               devops1.pem=key file
               a1.sh= script ato add hots to inventory file in ansible
               modules(folder)-created 2 modules vpc(folder) and ec2(folder)
                              vpc(folder)-->main.tf=creates vpc,subnet,route table,internet gateway
                                            variable.tf=cidr block for vpc and subnet used as variable
                                            output.tf= to store subnet id and security group id for  passing it to ec2 module.
                              
                               ec2(folder)-->main.tf=contains resource block for instance,2 local exec provisioner-one to copy public ip of the instance to a file
                                                     and 2nd to run the script.remote exec provisioner with a connection block to install python3 in the instance created.
                                             variable.tf=ami, type of instance, key,security group id, subnet id


