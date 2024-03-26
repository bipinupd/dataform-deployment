#!/bin/bash
echo "{\"projectId\": \"bipin-dev-prj\", \"location\": \"US\"}" > .df-credentials.json
cat .df-credentials.json
npm i -g -quiet @dataform/cli
dataform install 
dataform run
