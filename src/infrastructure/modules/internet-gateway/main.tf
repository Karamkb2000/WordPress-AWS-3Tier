/*
creates an Internet Gateway for the specified VPC
for enabling communication between resources within the VPC and the internet.
*/

resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = var.vpc_id
  tags = {
    "Name" = "wordpress_igw"
  }
}
