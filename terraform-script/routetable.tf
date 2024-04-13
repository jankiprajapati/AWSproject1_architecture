#Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name        = "${var.name}-public-route-table",
    },
    var.tags
  )
}

#Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name        = "${var.name}-private-route-table",
    },
    var.tags
  )
}
