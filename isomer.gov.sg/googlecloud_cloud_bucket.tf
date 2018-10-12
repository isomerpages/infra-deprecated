# Notes:
# Google Cloud Storage Bucket for isomer.gov.sg
# Resource name convention: isomer_bucket_[url_in_underscore]
# Bucket name convention:   isomer_[url_in_underscore]
resource "google_storage_bucket" "isomer_bucket_isomer_gov_sg" {
  name     = "isomer_isomer_gov_sg"
  project = "isomer"
  location = "asia-southeast1"
  storage_class = "MULTI_REGIONAL"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  cors {
    origin = ["www.isomer.gov.sg"]
    method = ["*"]
  }
}