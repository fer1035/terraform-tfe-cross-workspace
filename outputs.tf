output "environment" {
  description = "Environment data (map)."

  value = {
    project                   = tfe_project.project
    variable_sets_assignments = tfe_project_variable_set.project_variable_set
    team_assignments          = tfe_team_project_access.project_access
    workspaces                = tfe_workspace.workspace
    run_triggers              = tfe_run_trigger.run_trigger
  }
}
