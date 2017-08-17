#TSI Cloud Portal - generic server instance

A generic server Portal app deployable in the Cloud.  


## Requirements

A `network` and a `floating ip pool` are expected to be shared with other virtual machine, therefore is not provided and destroyed with this terraform description.  
If you want to provide a new network you can use the `cpa-network` terraform app.  


## Instructions

### General set up in the Cloud Portal

- Create a new entry in the `Profile`-`Cloud Credentials` section.  
- Create a new entry in the `Profile`-`Deployment Parameters` section.  
- Create a new entry in the `Profile`-`Configurations` section.


### Deployment in the Cloud Portal

- Create a new `Deployment` choosing the `app` form the `Reposotory` menu.  
- Select the provider to use form the top left corner radio menu: `Select provider`.  
- Enter the required input in the `Inputs` section.  
- Select a configuration in the `Deployment paramters` section.  


###  ssh connection

Once the Virtual machine is deployed you can connect to it with:

```
ssh -i `~/.ssh/your_private_key_name` `OS_default_user`@`external_ip_provided_in_the_portal_output`
```

i.e:

```
ssh -i ~/.ssh/id_rsa ubuntu@216.58.212.78
```



### Configuration example

Note: most of this values are specific for each cloud provider and in many cases specific for your environment inside the cloud provider himself.

#### Inputs

##### OpenStack

| Input name            | Input value |
| ---                   | --- |
| `disk_image`          | `ubuntu-16.04` |
| `machine_type`        | `s1.nano` |


#### Deployment parameters

##### OpenStack
`name`: `extcloud-05`

| Parameter name        | Parameter value |
| ---                   | --- |
| `network_name`        | `test_network` |
| `floatingip_pool`     | `ext-net` |
