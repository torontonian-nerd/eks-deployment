module "bastion_host" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "6.0.2"
  name                   = "BastionHost"
  ami                    = data.aws_ami.amazonlinux2023.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id              = module.myvpc.public_subnets[0]
  vpc_security_group_ids = [module.bastion_sg.security_group_id]
}