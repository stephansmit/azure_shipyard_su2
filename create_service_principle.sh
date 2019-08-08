SP_NAME="su2shipyard2"
SP_OUTPUT=$(az ad sp create-for-rbac --name "${SP_NAME}")
TENANT=$(echo "${SP_OUTPUT}" | jq --raw-output '.tenant')
PASSWORD=$(echo "${SP_OUTPUT}" | jq --raw-output '.password')
APPID=$(echo "${SP_OUTPUT}" | jq --raw-output '.appId')

echo "TENANT=${TENANT}" > AZURE_CREDS
echo "PASSWORD=${PASSWORD}" >> AZURE_CREDS
echo "APPID=${APPID}" >> AZURE_CREDS

