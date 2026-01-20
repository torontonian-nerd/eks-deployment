data "aws_availability_zones" "available" {
} # Tells Terraform to query AWS for all currently available Availability Zones (AZs) in the region you’re working in. It doesn’t create anything — it just fetches information

module "myvpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  # VPC Basic Details

  name            = var.cluster_name
  cidr            = var.vpc_cidr_block
  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets
  map_public_ip_on_launch = true # Instances launched into the Public subnet should be assigned a public IP address.

  # # Database subnets

  # database_subnets                   = var.vpc_database_subnets
  # create_database_subnet_group       = var.vpc_create_database_subnet_group
  # create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  # NAT Gateways for private subnets for Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway # Single NAT Gateway per AZ , Mutiple will incur more costs and its more for a HA setup

  # VPC DNS Parameters
  enable_dns_hostnames = true # Allows EC2 with public ip to get a public DNS hostname
  enable_dns_support   = true # Allows instances inside VPC to resolve public DNS names using AWS's internal DNS server at 169.254.169.253

}

