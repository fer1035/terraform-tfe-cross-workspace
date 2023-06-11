resource "tfe_workspace" "workspace" {
  for_each = var.workspace_configurations

  name         = each.key
  organization = var.org_name
  project_id   = tfe_project.project.id
  auto_apply   = true
  tag_names    = each.value.tags

  lifecycle {
    ignore_changes = all
    /* ignore_changes = [
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
    ] */
  }
}

resource "tfe_run_trigger" "run_trigger" {
  for_each = {
    for workspace_name, workspace in var.workspace_configurations : workspace_name => workspace
    if workspace.trigger_source != null
  }

  workspace_id  = tfe_workspace.workspace["${each.key}"].id
  sourceable_id = tfe_workspace.workspace["${each.value.trigger_source}"].id

  depends_on = [tfe_workspace.workspace]
}
