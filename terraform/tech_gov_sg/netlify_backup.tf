# Notes:
# Netlify backup site for tech.gov.sg
# Netlify deploy key name convention: isomer_backup_deploy_key_[url_in_underscore]
# Netlify site name convention: isomer_backup_netlify_site_[url_in_underscore]

resource "netlify_deploy_key" "isomer_backup_deploy_key_tech_gov_sg" {}

resource "netlify_site" "isomer_backup_netlify_site_tech_gov_sg" {
  name = "tech-gov-sg-backup"

  repo {
    command       = "bundle exec jekyll build"
    deploy_key_id = "${netlify_deploy_key.isomer_backup_deploy_key_tech_gov_sg.id}"
    dir           = "_site/"
    provider      = "github"
    repo_path     = "isomerpages/isomerpages-govtech"
    repo_branch   = "master"
  }
}
