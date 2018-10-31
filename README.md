## Isomer Terraform

### Making a change to the infrastructure

1. Make the relevant changes in the **terraform** folder.

Naming convention:
**Folders** - website url in lowercase, with periods replaced by underscores. e.g. `isomer_gov_sg` for _isomer.gov.sg_

**Files** - cloud provider concatenated with function in lower case, with periods replaced by underscores. e.g. `aws_cdn.tf` or `googlecloud_cloud_bucket.tf`

2. Format the terraform files. Run this in the root folder (_infra_).

```
terraform fmt terraform
```

3. Run terraform plan locally

```
. ./run-terraform.sh
cd run-dir
terraform init
terraform plan
```

4. If everything looks fine, push it to a branch and make a pull request.