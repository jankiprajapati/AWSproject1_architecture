# Create a DB security group
resource "aws_security_group" "rds_security_group" {
  name        = "${var.name}-rds-sg"
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "MySQL/Aurora from Any IpV4"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
   description      = "allow all traffic"
   from_port        = 0
   to_port          = 0
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
  }
}


#SubnetGroup for RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.private[0].id, aws_subnet.private[1].id]
} 

#RDS- MySQL
resource "aws_db_instance" "sqldatabase" {
  engine               = "mysql"
  engine_version       = "8.0.35"
  identifier           = "db1"
  username             = "admin"
  password             = "admin1234567"
  instance_class       = "db.t2.micro"
  storage_type         = "gp2"
  allocated_storage    = 20
  publicly_accessible  = false
  skip_final_snapshot  = true
  db_name              = "projdb"
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  multi_az               = "false"
  tags = {
    Name = "Proj-DB"
  }
}
