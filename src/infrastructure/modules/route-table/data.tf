/*
Retrieves information about the default route table for the specified VPC and
obtain details about the default route table associated with the VPC specified and 
Filter is applied to specifically retrieve the main (default) route table.
*/

data "aws_route_table" "wordpress_default_route_table" {
  vpc_id = var.vpc_id

  filter {
    name   = "association.main"
    values = ["true"]
  }
}
