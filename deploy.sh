#!/bin/bash
echo "{\"projectId\": \"bipin-dev-prj\", \"location\": \"US\"}" > .df-credentials.json
cat << EOF > dataform.json
 {
    "defaultSchema": "example1",
    "assertionSchema": "dataform_assertions",
    "warehouse": "bigquery",
    "defaultDatabase": "$PROJECT_ID",
    "defaultLocation": "us-central1",
    "vars": {
      "STAGING_SCHEMA": "stage",
      "REPORTING_SCHEMA": "report"
    }
  }
EOF
cat .df-credentials.json
npm i -g -quiet @dataform/cli
dataform install 
dataform run
