#!/bin/bash

JIRA_BASEURL=https://192.168.0.168
JIRA_USERNAME=admin
JIRA_PASSWORD=admin
PROJECT=XT
FILE=features.zip


zip -r $FILE features/ -i \*.feature
curl -H "Content-Type: multipart/form-data" -u $JIRA_USERNAME:$JIRA_PASSWORD -F "file=@$FILE" "$JIRA_BASEURL/rest/raven/1.0/import/feature?projectKey=$PROJECT"
