output "lambdas" {
  value = [{
    arn           = aws_lambda_function.hello_api.arn
    name          = aws_lambda_function.hello_api.function_name
    version       = aws_lambda_function.hello_api.version
    description   = aws_lambda_function.hello_api.description
    last_modified = aws_lambda_function.hello_api.last_modified
  }]
}
