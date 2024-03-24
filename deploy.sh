#!/bin/bash
echo 'Example'
echo '{"projectId": "${PROJECT_ID}", "location": "us"}' > .df-credentials.json
dataform install 
datafrom run
