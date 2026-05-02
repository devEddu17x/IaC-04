resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "private_b" {
  vpc_id = aws_vpc.main.id
}
