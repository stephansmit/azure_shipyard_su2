#!/bin/bash
source AZURE_RESOURCE_NAMES

echo "Create the service principle"
SP_OUTPUT=$(az ad sp create-for-rbac --name "${SERVICE_PRINCIPLE_NAME}")
TENANT=$(echo "${SP_OUTPUT}" | jq --raw-output '.tenant')
PASSWORD=$(echo "${SP_OUTPUT}" | jq --raw-output '.password')
APPID=$(echo "${SP_OUTPUT}" | jq --raw-output '.appId')

echo "Store the Service Principle Credentials"
echo "TENANT=${TENANT}" > SERVICE_PRINCIPLE_CREDS
echo "PASSWORD=${PASSWORD}" >> SERVICE_PRINCIPLE_CREDS
echo "APPID=${APPID}" >> SERVICE_PRINCIPLE_CREDS

