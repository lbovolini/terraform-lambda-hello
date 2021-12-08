#!/bin/bash

python -m venv venv/hello-api
source venv/hello-api/bin/activate

FILE=$lambdas_path/hello-api/requirements.txt
pip install -r "$FILE" -t ${local.lambdas_path}/hello-api