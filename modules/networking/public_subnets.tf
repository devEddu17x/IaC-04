resource "aws_subnet" "public-AZ-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.aws_region}${var.aws_availability_zone_main}"
}

resource "aws_subnet" "public-AZ-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.aws_region}${var.aws_availability_zone_replica}"
}
