module "vpc" {
  source = "./modules/vpc"
}
module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id
}
module "alb" {
  source = "./modules/alb"

  vpc_id            = module.vpc.vpc_id
  public_subnet_1   = module.vpc.public_subnet_1_id
  public_subnet_2   = module.vpc.public_subnet_2_id
  alb_sg_id         = module.security.alb_sg_id
}
module "ec2" {
  source = "./modules/ec2"

  private_subnet_1 = module.vpc.private_subnet_1_id
  private_subnet_2 = module.vpc.private_subnet_2_id

  ec2_sg_id = module.security.ec2_sg_id

  target_group_arn = module.alb.target_group_arn
}
module "rds" {
  source = "./modules/rds"

  private_subnet_1 = module.vpc.private_subnet_1_id
  private_subnet_2 = module.vpc.private_subnet_2_id

  rds_sg_id = module.security.rds_sg_id
}
