variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "eksdemo"
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)"
  type        = string
  default     = null
}

variable "cluster_endpoint_private_access" {
  description = "Tells how EKS cluster API server is accessed . Here the worker nodes in private subnet access the EKS Control Plane"
  type        = bool
  default     = null
}

variable "cluster_endpoint_public_access" {
  description = "Tells how EKS cluster API server is accessed . Here the worker nodes in private subnet access the EKS Control Plane"
  type        = bool
  default     = null
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "Tells which IP range kubectl can run on to reach EKS cluster API server"
  type        = list(string)
  default     = null
}

