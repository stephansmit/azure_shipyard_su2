#!/bin/bash
source AZURE_RESOURCE_NAMES
source SERVICE_PRINCIPLE_CREDS
echo "login with service principle"
az login --service-principal -u $APPID -p $PASSWORD -t $TENANT

echo "Creating a resource group"
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "creating a storage account"
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP

echo "Creating a batch account"
batch_output=$(az batch account create --name $BATCH_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --storage-account $STORAGE_ACCOUNT_NAME --location $LOCATION)

echo "Get batch account service url"
BATCH_ACCOUNT_SERVICEURL=$(echo "${batch_output}" | jq --raw-output '.accountEndpoint')

echo "Get batch account key"
batch_output=$(az batch account keys list --name $BATCH_ACCOUNT_NAME --resource-group $RESOURCE_GROUP)
BATCH_ACCOUNT_KEY=$(echo "${batch_output}" | jq --raw-output '.primary')

echo "Get storage account key"
storage_output=$(az storage account keys list --account-name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP)
STORAGE_ACCOUNT_KEY=$(echo $storage_output | jq --raw-output '.[1].value')

echo "Store the Shipyard Credentials"
echo "STORAGE_ACCOUNT_NAME=${STORAGE_ACCOUNT_NAME}" > SHIPYARD_CREDS
echo "STORAGE_ACCOUNT_KEY=${STORAGE_ACCOUNT_KEY}" >> SHIPYARD_CREDS
echo "BATCH_ACCOUNT_NAME=${BATCH_ACCOUNT_NAME}" >> SHIPYARD_CREDS
echo "BATCH_ACCOUNT_SERVICEURL=${BATCH_ACCOUNT_SERVICEURL}" >> SHIPYARD_CREDS
echo "BATCH_ACCOUNT_KEY=${BATCH_ACCOUNT_KEY}" >> SHIPYARD_CREDS
