resource "aws_subnet" "private-AZ-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "${var.aws_region}${var.aws_availability_zone_main}"
}

resource "aws_subnet" "private-AZ-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "${var.aws_region}${var.aws_availability_zone_replica}"
}
