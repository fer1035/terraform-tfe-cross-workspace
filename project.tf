resource "tfe_project" "project" {
  name         = var.project_name
  organization = var.org_name
}

data "tfe_variable_set" "variable_set" {
  for_each = {
    for set, var_set in toset(var.variable_sets) : set => var_set
    if var.variable_sets != null
  }

  name         = each.key
  organization = var.org_name
}

resource "tfe_project_variable_set" "project_variable_set" {
  for_each = {
    for set, var_set in data.tfe_variable_set.variable_set : set => var_set
    if var.variable_sets != null
  }

  variable_set_id = each.value.id
  project_id      = tfe_project.project.id
}

data "tfe_team" "team" {
  for_each = {
    for team, team_name in var.teams : team => team_name
    if var.teams != null
  }

  name         = each.key
  organization = var.org_name
}

resource "tfe_team_project_access" "project_access" {
  for_each = {
    for team, team_name in data.tfe_team.team : team => team_name
    if var.teams != null
  }

  access     = var.teams["${each.key}"]
  team_id    = each.value.id
  project_id = tfe_project.project.id
}
