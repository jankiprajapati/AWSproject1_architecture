variable "name" {
    description = "Name of the VPC"
    type = string    
    default = "Proj-VPC"
}

variable "region" {
    description = "Region Of VPC"
    type = string 
    default = "us-east-1"  
}

variable "availability_zones" {
    description = "Region Of VPC"
    type = list(string)
    default = ["us-east-1a", "us-east-1b"]
}

variable "tags" {
    description = "Region Of VPC"
    type = map
    default = null
}

variable "vpc_cidr_block" {
    description = "CIDR Range Of VPC"
    type = string  
    default = "13.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
    description = "Region Of VPC"
    type = list(string)  
    default = ["13.0.1.0/24", "13.0.2.0/24"]  
}

variable "private_subnet_cidr_blocks" {
    description = "Region Of VPC"
    type = list(string) 
    default = ["13.0.3.0/24", "13.0.4.0/24"]  
}


variable "ami_id_ubuntu" {
    description = "Ami Id of ubuntu in specified-region"
    type = string  
    default = "ami-07d9b9ddc6cd8dd30"
}

variable "inst_type_1" {
    description = "instance type of ec2"
    type = string 
    default = "t2.micro" 
}

variable "bucket_name" {
    description = "name of s3 bucket"
    type = string 
    default =  "projbucket-494273343511"
}

variable "versioning" {
    description = "versioning for s3 bucket"
    type = string  
    default = "Disabled"
}

variable "dynamodbname" {
    description = "name of Dynamo-db Table"
    type = string 
    default =  "employee_image_table"     
}


variable "health_check" {
   type = map(string)
   default = {
      "timeout"  = "10"
      "interval" = "20"
      "path"     = "/"
      "port"     = "80"
      "unhealthy_threshold" = "2"
      "healthy_threshold" = "3"
    }
}
