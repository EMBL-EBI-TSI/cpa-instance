# TSI Cloud Portal - generic server instance

A generic server Portal app deployable in the Cloud.  

## Requirements

A `network` and a `floating ip pool` are expected to be shared with other virtual machines, therefore is not provided and destroyed with this terraform description.  
If you want to provide a new network you can use the `cpa-network` terraform app.  

## Instructions

### General set up in the Cloud Portal

- Create a new entry in the `Profile`-`Cloud Credentials` section.  
- Create a new entry in the `Profile`-`Deployment Parameters` section.  
- Create a new entry in the `Profile`-`Configurations` section.

### Deployment in the Cloud Portal

- Create a new `Deployment` choosing the `app` form the `Repository` menu.  
- Select the provider to use form the top left corner radio menu: `Select provider`.  
- Enter the required input in the `Inputs` section.  
- Select a configuration in the `Deployment parameters` section.  

###  ssh connection

Once the Virtual machine is deployed you can connect to it with:

```
ssh -i `~/.ssh/your_private_key_name` `OS_default_user`@`external_ip_provided_in_the_portal_output`
```

i.e:

```
ssh -i ~/.ssh/id_rsa ubuntu@216.58.212.78
```

In AWS, the `OS_dafualt_user` is always `ec2-user`.

In Azure, the `OS_dafualt_user` is always `clouduser`


### Configuration example

Note: most of this values are specific for each cloud provider and in many cases specific for your environment inside the cloud provider himself.  
The `disk_image_name` in AWS is referred to the [`AMI`](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) value, which is also different, for the same Image, in every AWS region.

#### Inputs

Inputs entry is not mandatory, if a default input value is defined in the terraform configuration, it will be used when no inputs are entered.

##### OpenStack

| Input name            | Input value |
| ---                   | --- |
| `disk_image_name`     | `ubuntu-16.04` |
| `machine_type`        | `s1.nano` |


##### AWS

| Input name            | Input value |
| ---                   | --- |
| `disk_image_name`     | `ami-bb9a6bc2` |
| `machine_type`        | `t2.micro` |

##### Azure

| Parameter name        | Parameter value |
| ---                   | --- |
| `region`            	| `westeurope` |
| `resource_group`     	| `resourcegroup_from_cpa_network` |

#### Deployment parameters

The current version of the portal is requiring to include the parameters of all the cloud providers, in the deployment configurations. This behaviour will change soon, for the moment just enter a random value for the parameters that are not necessary for your cloud provider.

| Parameter name        | Parameter value |
| ---                   | --- |
| `network_name`        | `test_network` |
| `floating_ip_pool`    | `ext-net` |
| `subnet_id`           | `subnet-123xyzta` |


##### OpenStack

`name`: `extcloud-05`

| Parameter name        | Parameter value |
| ---                   | --- |
| `network_name`        | `test_network` |
| `floating_ip_pool`    | `ext-net` |

##### AWS

| Parameter name        | Parameter value |
| ---                   | --- |
| `subnet_id`           | `subnet-123xyzta` |

This information will be available in your AWS console, when using a manually configured AWS subnet, or will be available as an output in the `Deployments` page when you are using the appliance `cpa-network `.

##### Azure

For the deployment parameters, only `subnet_id` and `network_name` are relevant:

| Parameter name        | Parameter value |
| ---                   | --- |
| `floating_ip_pool`    | `NA` |
| `network_name`        | `network_from_cpa_network` |
| `subnet_id`           | `/subscriptions/sub-id/resourceGroups/resgroup/subnets/subnet`

## AWS Cloud Credential

Create an entry in the `Cloud Credentials` section whit Parameters:

| Parameter name        | Parameter value |
| ---                   | --- |
|`AWS_ACCESS_KEY_ID`    | `AKIAIOSFODNN7EXAMPLE`|
|`AWS_SECRET_ACCESS_KEY`| `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY`|
|`AWS_DEFAULT_REGION`   | `eu-west-1`|

You can find the first two values (or create a new credential) in your AWS user page, under the section `IAM` --> `USERS`.  
The available regions, at the moment of writing, are the following:

|Code              | Name|
| ---              | --- |
|`us-east-1`       |`US East (N. Virginia)`|
|`us-east-2`       |`US East (Ohio)`|
|`us-west-1`       |`US West (N. California)`|
|`us-west-2`       |`US West (Oregon)`|
|`ca-central-1`    |`Canada (Central)`|
|`eu-west-1`       |`EU (Ireland)`|
|`eu-central-1`    |`EU (Frankfurt)`|
|`eu-west-2`       |`EU (London)`|
|`ap-northeast-1`  |`Asia Pacific (Tokyo)`|
|`ap-northeast-2`  |`Asia Pacific (Seoul)`|
|`ap-southeast-1`  |`Asia Pacific (Singapore)`|
|`ap-southeast-2`  |`Asia Pacific (Sydney)`|
|`ap-south-1`      |`Asia Pacific (Mumbai)`|
|`sa-east-1`       |`South America (São Paulo)`|

Note: In order to use the default `AMI` value with `cpa-instance` you can choose `eu-west-1`
