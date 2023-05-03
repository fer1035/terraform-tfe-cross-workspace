module "cross-workspace-test" {
  source = "app.terraform.io/fer1035/cross-workspace/tfe"

  org_name         = "fer1035"
  project_name     = "cross_workspace_test"
  varset_name      = "cross_workspace_test"
  workspace_0_name = "cross_workspace_test_0"
  workspace_1_name = "cross_workspace_test_1"
  workspace_2_name = "cross_workspace_test_2"
  team_name        = "owners"
}
