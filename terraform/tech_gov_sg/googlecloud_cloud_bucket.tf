# Notes:
# Google Cloud Storage Bucket for tech.gov.sg
# Resource name convention: isomer_bucket_[url_in_underscore]
# Bucket name convention:   isomer_[url_in_underscore]

resource "google_storage_bucket" "isomer_bucket_tech_gov_sg" {
  name          = "tech.gov.sg"
  project       = "isomer-219002"
  location      = "asia-southeast1"
  storage_class = "REGIONAL"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  cors {
    origin = ["www.tech.gov.sg"]
    method = ["*"]
  }
}

# Grant storage object admin role to the service account
resource "google_storage_bucket_iam_binding" "isomer_storage_bucket_iam_binding_tech_gov_sg" {
  bucket = "${google_storage_bucket.isomer_bucket_tech_gov_sg.name}"
  role   = "roles/storage.objectAdmin"

  members = [
    "serviceAccount:${google_service_account.isomer_service_account_tech_gov_sg.email}",
  ]
}

# Grant public read to everyone
resource "google_storage_bucket_iam_member" "isomer_storage_bucket_iam_member_tech_gov_sg" {
  bucket = "${google_storage_bucket.isomer_bucket_tech_gov_sg.name}"
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
