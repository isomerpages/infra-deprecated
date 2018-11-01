## Isomer Terraform

### Overview

This is the Terraform repository that controls the infrastructure for Isomer. [Isomer](https://www.isomer.gov.sg) is a lightweight static website solution to develop and deploy informational websites for the Singapore Government. The project is run by [GovTech Singapore](https://www.tech.gov.sg).

---

### Infrastructure Design

![Infrastructure diagram for Isomer](/assets/infra.png)

#### Infra design philosophy/decisions

Simplicity:
- Static website hosting for simple informational websites
- Using modular hosting services that serve pages over HTTPS (Netlify and GitHub Pages)

Reliability:
- CDN + Backup website hosting (Netlify)

Version Control/Logging
- Using Terraform to manage major pieces of infra
- Logging CDN access logs in S3

---

### Repo organization

The main folder to take note of is the **terraform** folder. The **terraform** folder contains all the individual terraform files for each Isomer website.

Naming convention:
**Folders** - website url in lowercase, with periods replaced by underscores. e.g. `isomer_gov_sg` for _isomer.gov.sg_

**Files** - cloud provider concatenated with function in lower case, with periods replaced by underscores. e.g. `aws_cdn.tf` or `googlecloud_cloud_bucket.tf`

Example **terraform** folder organization:

```
terraform
	|
	+ website_A_gov_sg // website_A subfolder
	|	|
	|	+ aws_cdn.tf
	|	+ netlify_backup.tf
	|	+ netlify_staging.tf
	|
	+ website_B_gov_sg // website_B subfolder
	|	|
	|	+ aws_cdn.tf
	|	+ netlify_backup.tf
	|	+ netlify_staging.tf
	|
	+ website_C_gov_sg // website_C subfolder
		|
		+ aws_cdn.tf
		+ netlify_backup.tf
		+ netlify_staging.tf

```

---

### Making a Change to the Infrastructure

1. Make the relevant changes in the **terraform** folder.

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