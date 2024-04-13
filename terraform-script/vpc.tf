#vpc
resource "aws_vpc" "main"{
 tags = merge (
      {
          Name = var.name
      },
      var.tags
  )
 cidr_block = var.vpc_cidr_block                       
}

#public-subnet
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  tags = merge (
      {
          Name = "${var.name}-public-subnet-${count.index}"
      },
      var.tags
  )
}

#Route table associasion for public-subnet
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


#private-subnet
resource "aws_subnet" "private" {
  count                   = length(var.private_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  tags = merge (
      {
          Name = "${var.name}-private-subnet-${count.index}"
      },
      var.tags
  )
}

#Route table associasion for private-subnet
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
