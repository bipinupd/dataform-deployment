#!/bin/bash
export PROJECT_ID=$1
export LOCATION=$2

echo "{\"projectId\": \"bipin-dev-prj\", \"location\": \"US\"}" > .df-credentials.json
cat << EOF > dataform.json
 {
    "defaultSchema": "example1",
    "assertionSchema": "dataform_assertions",
    "warehouse": "bigquery",
    "defaultDatabase": $PROJECT_ID,
    "defaultLocation": $LOCATION,
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
