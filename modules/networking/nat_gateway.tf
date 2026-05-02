resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_a.id
  subnet_id     = aws_subnet.public-AZ-a.id
  depends_on    = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.nat_b.id
  subnet_id     = aws_subnet.public-AZ-b.id
  depends_on    = [aws_internet_gateway.gw]
}
