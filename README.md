## Isomer Terraform

#### How to use

1. Make the relevant changes in the **terraform** folder.

Naming convention:
**Folders** - website url in lowercase, with periods replaced by underscores. e.g. `isomer_gov_sg` for _isomer.gov.sg_

**Files** - cloud provider concatenated with function in lower case, with periods replaced by underscores. e.g. `aws_cdn.tf` or `googlecloud_cloud_bucket.tf`

2. Make sure that you are in the root directory, and run the following code:

```
. run-terraform.sh
cd run-dir
terraform plan
terraform apply
```