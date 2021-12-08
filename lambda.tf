# Cria ambiente virtual
resource "null_resource" "install_venv" {
  triggers = {
    exists = fileexists("${local.venv_path}/hello-api/bin/activate")
  }

  provisioner "local-exec" {
    command = "python -m venv ${local.venv_path}/hello-api"
  }
}

# Instala as dependencias
resource "null_resource" "install_layer_deps" {
  # triggers = {
  #   # Dispara o trigger somente se o arquivo sofrer alterações
  #   layer_build = filemd5("${local.lambdas_path}/hello-api/requirements.txt")
  # }

  provisioner "local-exec" {
    command = "source ${local.venv_path}/hello-api/bin/activate && pip install -r ${local.lambdas_path}/hello-api/requirements.txt -t ${local.lambdas_path}/hello-api"
  }

  depends_on = [
    null_resource.install_venv
  ]
}

# Gera zip da aplicacao lambda com as dependencias
data "archive_file" "hello_api_artifact" {
  output_path = "files/hello-api-artifact.zip"
  type        = "zip"
  source_dir  = "${local.lambdas_path}/hello-api"

  depends_on = [
    null_resource.install_layer_deps
  ]
}

resource "aws_lambda_function" "hello_api" {
  function_name = "hello"
  handler       = "main.lambda_handler"
  role          = aws_iam_role.hello_api_lambda_role.arn
  runtime       = "python3.9"

  filename         = data.archive_file.hello_api_artifact.output_path
  source_code_hash = data.archive_file.hello_api_artifact.output_base64sha256

  timeout     = 1
  memory_size = 128

  tags = local.common_tags
}
