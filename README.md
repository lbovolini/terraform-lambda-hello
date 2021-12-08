# Exemplo de aplicação AWS Lambda utilizando Terraform

## Instruções de execução local via localstack

1. ### iniciar localstack

```bash
localstack start
```

2. ### entrar na pasta do projeto e executar o terraform

```bash
terraform apply -auto-approve
```

3. ### executar a lambda

```bash
awslocal lambda invoke --function-name hello output.json
```

4. ### verificar a saída no arquivo output.json

```json
"Hello world!"
```