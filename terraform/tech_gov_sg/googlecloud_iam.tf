# Notes:
# Google IAM and ACL for tech.gov.sg
# IAM policy name convention: isomer_iam_policy_[url_in_underscore]
# Service account IAM policy name convention: isomer_service_account_iam_policy_[url_in_underscore]
# Bucket ACL name convention: isomer_bucket_acl_[url_in_underscore]
# Bucket name convention: isomer_bucket_[url_in_underscore]
# Service account name convention: [url-in-hyphen]@@isomer-219002.iam.gserviceaccount.com

# Create service account
resource "google_service_account" "isomer_service_account_tech_gov_sg" {
  account_id   = "tech-gov-sg"
  display_name = "tech-gov-sg"
  project      = "isomer-219002"
}
