/*
captures the subnet IDs for private_3 and private_4 subnets, using the values provided in the var.subnet_ids variable.
*/

locals {
  subnet_ids = {
    private_3 = { subnet_id = var.subnet_ids.private_3 },
    private_4 = { subnet_id = var.subnet_ids.private_4 },
  }
}
