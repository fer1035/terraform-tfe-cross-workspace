resource "tfe_project" "project" {
  name         = var.project_name
  organization = var.org_name
}

data "tfe_variable_set" "variable_set" {
  for_each = toset(var.variable_sets)

  name         = each.key
  organization = var.org_name
}

resource "tfe_project_variable_set" "project_variable_set" {
  for_each = data.tfe_variable_set.variable_set

  variable_set_id = each.value.id
  project_id      = tfe_project.project.id
}

data "tfe_team" "team" {
  for_each = var.teams

  name         = each.key
  organization = var.org_name
}

resource "tfe_team_project_access" "project_access" {
  for_each = data.tfe_team.team

  access     = var.teams["${each.key}"]
  team_id    = each.value.id
  project_id = tfe_project.project.id
}
