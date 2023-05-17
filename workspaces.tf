resource "tfe_workspace" "workspace" {
  for_each = var.workspace_configurations

  name         = each.key
  organization = var.org_name
  project_id   = tfe_project.project.id
  auto_apply   = true

  lifecycle {
    ignore_changes = [
      agent_pool_id,
      auto_apply,
      description,
      execution_mode,
      force_delete,
      operations,
      queue_all_runs,
      trigger_patterns,
      working_directory,
      vcs_repo
    ]
  }
}

/* resource "tfe_team_access" "team_access" {
  for_each = {
    for workspace_name, workspace in tfe_workspace.workspace : workspace_name => workspace
    if var.team_name != "owners"
  }

  access       = "write"
  team_id      = data.tfe_team.team.id
  workspace_id = tfe_workspace.workspace["${each.key}"].id

  depends_on = [tfe_workspace.workspace]
} */

resource "tfe_run_trigger" "run_trigger" {
  for_each = {
    for workspace_name, workspace in var.workspace_configurations : workspace_name => workspace
    if workspace.trigger_source != null
  }

  workspace_id  = tfe_workspace.workspace["${each.key}"].id
  sourceable_id = tfe_workspace.workspace["${each.value.trigger_source}"].id

  depends_on = [tfe_workspace.workspace]
}
