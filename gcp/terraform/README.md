
# Instructions

Copy `terraform.tfvars.example` in a `terraform.tfvars` and compile the mandatory variables.

    cp terraform.tfvars.example terraform.tfvars
    vim terraform.tfvars

This configuration will be ignored by the git repository.

## Authentication JSON File

Authenticating with Google Cloud services requires a JSON file which we call the *account file*.

This file is downloaded directly from the [Google Developers Console](https://console.developers.google.com/). To make the process more straightforward, it is documented here:

Log into the [Google Developers Console](https://console.developers.google.com/) and select a project.

The API Manager view should be selected, click on "Credentials" on the left, then "Create credentials", and finally "Service account key".

Select "Compute Engine default service account" in the "Service account" drop-down, and select "JSON" as the key type.

Clicking "Create" will download your `credentials`.

Once you have your credentials you can export them to your environment with:

    export GOOGLE_CREDENTIALS="`cat credentials.json`"

## Deploy 

Test the configuration with:

    terraform plan

Deploy the instance:

    terraform apply

Remove the instance:

    terraform destroy

## Requirements

The network is expected to be shared with other virtual machines, therefore is not provided and destroyed with this terraform description.  
You need to set up the name of the network inside of the file `terraform.tfvars`.  
If you want to provide a new network you can use the `shared-network` terraform description.
