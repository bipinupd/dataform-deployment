#!/bin/bash
export PROJECT_ID=$1
export LOCATION=$2

echo "{\"projectId\": \"$PROJECT_ID\", \"location\": \"$LOCATION\"}" > .df-credentials.json
cat << EOF > dataform.json
 {
    "defaultSchema": "",
    "assertionSchema": "dataform_assertions",
    "warehouse": "bigquery",
    "defaultDatabase": "$PROJECT_ID",
    "defaultLocation": "$LOCATION",
    "vars": {
      "STAGING_SCHEMA": "stage",
      "REPORTING_SCHEMA": "report"
    }
  }
EOF
cat .df-credentials.json
cat dataform.json
npm i -g -quiet @dataform/cli
dataform install 
dataform run
