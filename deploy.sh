#!/bin/bash
echo "{\"projectId\": \"${PROJECT_ID}\", \"location\": \"${_BQ_LOCATION}\"}" > .df-credentials.json
npm i -g -quiet @dataform/cli
dataform install 
dataform run
