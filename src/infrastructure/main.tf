module "vpc_module" {
  source = "./modules/vpc"
}

module "subnet_module" {
  source   = "./modules/subnets"
  vpc_id   = module.vpc_module.vpc_id
  zone_one = var.zone_one
  zone_two = var.zone_two
}

module "internet_gateway_module" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc_module.vpc_id
}


