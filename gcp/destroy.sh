#!/usr/bin/env bash
set -e
# Destroys a virtual machine instance in GCP
terraform destroy --force --state=$PORTAL_DEPLOYMENTS_ROOT'/'$PORTAL_DEPLOYMENT_REFERENCE'/terraform.tfstate' $PORTAL_APP_REPO_FOLDER'/gcp/terraform'
