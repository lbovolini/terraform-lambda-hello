locals {
  lambdas_path = "${path.module}/lambdas"
  layers_path  = "${path.module}/layers"
  venv_path    = "${path.module}/env"


  common_tags = {
    Project   = "Lambda Layers"
    CreatedAt = formatdate("YYYY-MM-DD", timestamp())
    ManagedBy = "Terraform"
    Owner     = "Lucas Bovolini"
  }
}