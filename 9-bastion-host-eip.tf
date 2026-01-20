resource "aws_eip" "bastion_eip" {
  depends_on = [module.bastion_sg, module.myvpc]
  instance   = module.bastion_host.id
  domain     = "vpc"
}