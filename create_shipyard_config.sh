#!/bin/bash
echo "Load the Azure Resource Names"
source AZURE_RESOURCE_NAMES
echo "Load the Shipyard Credentials"
source SHIPYARD_CREDS

echo "Create the credential files"
eval "echo \"$(< credentials.yaml.template)\"" > shipyard_configdir/credentials.yaml
eval "echo \"$(< credentials.yaml.template)\"" > shipyard_configdir_singularity/credentials.yaml
eval "echo \"$(< credentials.yaml.template)\"" > shipyard_configdir_su2/credentials.yaml
