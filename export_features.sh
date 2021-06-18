#!/bin/bash

JIRA_BASEURL=https://192.168.2.168
JIRA_USERNAME=admin
JIRA_PASSWORD=admin
KEYS="XT-142"

rm -f features.zip
curl -u $JIRA_USERNAME:$JIRA_PASSWORD  "$JIRA_BASEURL/rest/raven/2.0/export/test?keys=$KEYS&fz=true" -o features.zip
unzip -o features.zip  -d features
