# Notes:
# Google IAM and ACL for isomer.gov.sg
# IAM policy name convention: isomer_iam_policy_[url_in_underscore]
# Service account IAM policy name convention: isomer_service_account_iam_policy_[url_in_underscore]
# Bucket ACL name convention: isomer_bucket_acl_[url_in_underscore]
# Bucket name convention: isomer_bucket_[url_in_underscore]
# Service account name convention: [url-in-hyphen]@@isomer-219002.iam.gserviceaccount.com


# Allows the service account to have full access (read, write, delete, overwrite) to storage bucket objects
data "google_iam_policy" "isomer_iam_policy_isomer_gov_sg" {
  binding {
    role = "roles/storage.objectAdmin"

    members = [
      "serviceAccount:isomer_gov_sg@isomer-219002.iam.gserviceaccount.com",
    ]
  }
}

# Create service account
data "google_service_account" "isomer_service_account_isomer_gov_sg" {
  account_id = "preston-terraform"
  project = "isomer-219002"
}

resource "google_service_account_iam_policy" "isomer_service_account_iam_policy_isomer_gov_sg" {
    service_account_id = "${data.google_service_account.isomer_service_account_isomer_gov_sg.id}"
    policy_data = "${data.google_iam_policy.isomer_iam_policy_isomer_gov_sg.policy_data}"
}

# Limits access of bucket to the service account mentioned above
resource "google_storage_bucket_acl" "isomer_bucket_acl_isomer_gov_sg" {
  bucket = "${google_storage_bucket.isomer_bucket_isomer_gov_sg.name}"

  role_entity = [
    "OWNER:isomer-gov-sg@isomer-219002.iam.gserviceaccount.com",
  ]
}