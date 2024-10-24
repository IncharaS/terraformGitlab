module "vpc" {
    source = "./vpc"
}

module "ec2" {
    source = "./web"
    subnet = module.vpc.public_subnet
    sg = module.vpc.sg
}