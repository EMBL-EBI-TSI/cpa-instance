#!/usr/bin/env bash
set -e
# Get the status of a virtual machine instance

# Query Terraform state file
terraform show $PORTAL_DEPLOYMENTS_ROOT'/'$PORTAL_DEPLOYMENT_REFERENCE'/terraform.tfstate'

