module "cross-workspace" {
  source = "app.terraform.io/my-org/cross-workspace/tfe"

  org_name         = "my-org"
  project_name     = "my-project"
  varset_name      = "my-variables"
  workspace_0_name = "my-workspace-0"
  workspace_1_name = "my-workspace-1"
  workspace_2_name = "my-workspace-2"
}

output "my-workspace-0" {
  value = module.cross-workspace.workspace_0
}

output "my-workspace-1" {
  value = module.cross-workspace.workspace_1
}

output "my-workspace-2" {
  value = module.cross-workspace.workspace_2
}
