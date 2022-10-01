data "aws_eks_cluster" "example" {
  name = "my-cluster"
}
data "aws_eks_cluster_auth" "example" {
  name = "my-cluster"
}

terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.13.1"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "aws" {
  region = "sa-east-1"
}