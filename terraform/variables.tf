variable "cluster_name" {
  type = string
  default = "my-cluster"
}

variable "region" {
  type = string
  default = "sa-east-1"
}   

variable "kubernetes_version" {
  type = string
  default = "1.21"
}

variable "desired_size" {
  type = string
  default = "1"
}

variable "min_size" {
  type = string
  default = "1"
}

variable "max_size" {
  type = string
  default = "1"
}