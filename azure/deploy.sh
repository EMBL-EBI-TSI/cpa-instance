#!/usr/bin/env bash
set -e
# Provisions a virtual machine instance in GCP

# Export input variables in the bash environment
export TF_VAR_name="$(awk -v var="$PORTAL_DEPLOYMENT_REFERENCE" 'BEGIN {print tolower(var)}')"

# Launch provisioning of the VM
terraform apply --state=$PORTAL_DEPLOYMENTS_ROOT'/'$PORTAL_DEPLOYMENT_REFERENCE'/terraform.tfstate' $PORTAL_APP_REPO_FOLDER'/azure/terraform'

