#!/bin/bash

JIRA_BASEURL=https://192.168.0.168
JIRA_USERNAME=admin
JIRA_PASSWORD=admin

curl -H "Content-Type: application/json" -X POST -u $JIRA_USERNAME:$JIRA_PASSWORD --data @".tmp/json/login-feature.json" $JIRA_BASEURL/rest/raven/2.0/import/execution/cucumber
