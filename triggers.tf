resource "tfe_run_trigger" "trigger_0_1" {
  workspace_id  = tfe_workspace.workspace_1.id
  sourceable_id = tfe_workspace.workspace_0.id
}

resource "tfe_run_trigger" "trigger_1_2" {
  workspace_id  = tfe_workspace.workspace_2.id
  sourceable_id = tfe_workspace.workspace_1.id
}
