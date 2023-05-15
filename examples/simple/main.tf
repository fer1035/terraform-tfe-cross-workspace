module "cross-workspace" {
  source  = "app.terraform.io/my-org/cross-workspace/tfe"

  org_name         = "my-org"
  project_name     = "my-project"
}

output "my-workspaces" {
  value = module.cross-workspace.workspace
}
