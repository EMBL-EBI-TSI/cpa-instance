#!/usr/bin/env bash
set -e
# Provisions a virtual machine instance in GCP
export callback_api_key="very_strong_key"
export TF_VAR_name="$(awk -v var="$PORTAL_DEPLOYMENT_REFERENCE" 'BEGIN {print tolower(var)}')"

# Launch provisioning of the VM
terraform apply --state=$PORTAL_DEPLOYMENTS_ROOT'/'$PORTAL_DEPLOYMENT_REFERENCE'/terraform.tfstate' $PORTAL_APP_REPO_FOLDER'/gcp/terraform'

# Start local ssh-agent
eval "$(ssh-agent -s)"
ssh-add $KEY_PATH &> /dev/null

# Get ansible roles
cd gcp/ansible || exit
ansible-galaxy install -r requirements.yml

# Run Ansible
TF_STATE=$PORTAL_DEPLOYMENTS_ROOT'/'$PORTAL_DEPLOYMENT_REFERENCE'/terraform.tfstate' ansible-playbook -i /usr/local/bin/terraform-inventory -u centos -b --tags live deployment.yml > ansible.log 2>&1

# Kill local ssh-agent
eval "$(ssh-agent -k)"
