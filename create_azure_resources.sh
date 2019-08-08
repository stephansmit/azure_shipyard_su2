source AZURE_RESOURCE_NAMES
source AZURE_CREDS
echo "login with service principle"
az login --service-principal -u $APPID -p $PASSWORD -t $TENANT

echo "creating a resource group"
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "creating a storage account"
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP

echo "creating a batch account"
batch_output=$(az batch account create --name $BATCH_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --storage-account $STORAGE_ACCOUNT_NAME --location $LOCATION)

BATCH_ACCOUNT_SERVICEURL=$(echo "${batch_output}" | jq --raw-output '.accountEndpoint')
echo "BATCH_ACCOUNT_SERVICEURL=${BATCH_ACCOUNT_SERVICEURL}" > BATCH_CREDS

