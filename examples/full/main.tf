module "cross-workspace" {
  source = "app.terraform.io/fer1035/cross-workspace/tfe"

  org_name         = "my-org"
  project_name     = "my-project"
  varset_name      = "my-variables"
  workspace_0_name = "my-workspace-0"
  workspace_1_name = "my-workspace-1"
  workspace_2_name = "my-workspace-2"
  team_name        = "owners"
}
