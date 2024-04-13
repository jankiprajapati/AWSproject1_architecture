#Internet Gateway
resource "aws_internet_gateway" "igw"{
   vpc_id = aws_vpc.main.id
   tags = merge(
    {
      Name        = "${var.name}-igw",
    },
    var.tags
  )
}

#Route to IGW
resource "aws_route" "igw"{
 route_table_id = aws_route_table.public.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id = aws_internet_gateway.igw.id
}


#Elastic IP for Nat-GW
resource "aws_eip" "eip" {
  domain = "vpc"
}

#NAT-GW
resource "aws_nat_gateway" "ngw" {
  tags = merge(
    {
      Name        = "${var.name}-ngw",
    },
    var.tags
  )
 subnet_id = aws_subnet.public[0].id
 allocation_id = aws_eip.eip.id
}

#Route to NAT-GW
resource "aws_route" "ngw"{
 route_table_id = aws_route_table.private.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id = aws_nat_gateway.ngw.id
}
