# Exemplo de aplicação AWS Lambda utilizando Terraform

## Instruções de execução local via localstack

iniciar localstack

```bash
localstack start
```

 entrar na pasta do projeto e executar o terraform

```bash
terraform apply -auto-approve
```

executar a lambda

```bash
awslocal lambda invoke --function-name hello output.json
```

verificar a saída no arquivo output.json

```json
"Hello world!"
```