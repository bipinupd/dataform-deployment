#!/bin/bash
dataform install 
echo '{"projectId": "${PROJECT_ID}", "location": "us"}' > .df-credentials.json
datafrom run
