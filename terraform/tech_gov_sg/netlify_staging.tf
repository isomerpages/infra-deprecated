# Notes:
# Netlify staging site for tech.gov.sg
# Netlify deploy key name convention: isomer_staging_deploy_key_[url_in_underscore]
# Netlify site name convention: isomer_staging_netlify_site_[url_in_underscore]

// Configure the repository with the dynamically created Netlify key.
resource "github_repository_deploy_key" "isomer_staging_github_repository_deploy_key_tech_gov_sg" {
  title      = "Netlify"
  repository = "isomerpages-govtech"
  key        = "${netlify_deploy_key.isomer_staging_netlify_deploy_key_tech_gov_sg.public_key}"
  read_only  = false
}

// Create a webhook that triggers Netlify builds on push.
resource "github_repository_webhook" "isomer_staging_github_repository_webhook_tech_gov_sg" {
  repository = "isomerpages-govtech"
  name       = "web"
  events     = ["delete", "push", "pull_request"]

  configuration {
    content_type = "json"
    url          = "https://api.netlify.com/hooks/github"
  }

  depends_on = ["netlify_site.isomer_staging_netlify_site_tech_gov_sg"]
}

resource "netlify_deploy_key" "isomer_staging_netlify_deploy_key_tech_gov_sg" {}

resource "netlify_site" "isomer_staging_netlify_site_tech_gov_sg" {
  name = "tech-gov-sg-staging"

  repo {
    command       = "bundle exec jekyll build"
    deploy_key_id = "${netlify_deploy_key.isomer_staging_netlify_deploy_key_tech_gov_sg.id}"
    dir           = "_site/"
    provider      = "github"
    repo_path     = "isomerpages/isomerpages-govtech"
    repo_branch   = "staging"
  }
}
