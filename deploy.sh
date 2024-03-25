#!/bin/bash
echo "{\"projectId\": \"${PROJECT_ID}\", \"location\": \"${BQ_LOCATION}\"}" > .df-credentials.json
npm i -g -quiet @dataform/cli
cat << EOF >> dataform.json
{
    "defaultSchema": "example1",
    "assertionSchema": "dataform_assertions",
    "warehouse": "bigquery",
    "defaultDatabase": "${PROJECT_ID}",
    "defaultLocation": "us-central1",
    "vars": {
      "STAGING_SCHEMA": "stage",
      "REPORTING_SCHEMA": "report"
    }
  }
EOF
dataform install 
dataform run
