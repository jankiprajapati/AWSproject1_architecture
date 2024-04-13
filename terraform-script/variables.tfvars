#Environment
name                            = "MyVPC"
region                          = "us-east-1"
availability_zones              = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]


#VPC
vpc_cidr_block                  = "10.0.0.0/16"


#Subnets
public_subnet_cidr_blocks       = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr_blocks      = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

#ec2
ami_id_ubuntu                   = "ami-03f4878755434977f"
ami_id_amazonlinux              = "ami-0e670eb768a5fc3d4"
inst_type_1                     = "t2.micro"
inst_type_2                     = "t3.micro"

#s3
bucket_name                     = "proj-bucket-494273343511"
acl_enable                      = "private"                         //private or public
versioning                      = "Disabled"                        //Enabled or Disabled
