module "cross-workspace" {
  source  = "app.terraform.io/my-org/cross-workspace/tfe"

  org_name         = "my-org"
  project_name     = "my-project"
  varset_name      = "my-variables"
}

output "my-workspaces" {
  value = module.cross-workspace.workspace
}
