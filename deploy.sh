#!/bin/bash
echo 'Example'
echo "{\"projectId\": \"${PROJECT_ID}\", \"location\": \"${BQ_LOCATION}\"}" > .df-credentials.json
dataform install 
dataform run
