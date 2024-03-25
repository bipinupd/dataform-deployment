#!/bin/bash
echo "{\"projectId\": \"${PROJECT_ID}\", \"location\": \"${BQ_LOCATION}\"}" > .df-credentials.json
 npm i -g -quiet @dataform/cli
npm i -g envsub
envsubst < dataform.json > dataform.json
dataform install 
dataform run
