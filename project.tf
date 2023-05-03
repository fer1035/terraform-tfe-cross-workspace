data "tfe_variable_set" "variable_set" {
  name         = var.varset_name
  organization = var.org_name
}

data "tfe_team" "team" {
  name         = var.team_name
  organization = var.org_name
}

resource "tfe_project" "project" {
  name         = var.project_name
  organization = var.org_name
}

resource "tfe_project_variable_set" "project_variable_set" {
  variable_set_id = data.tfe_variable_set.variable_set.id
  project_id      = tfe_project.project.id
}

resource "tfe_team_project_access" "project_access" {
  count = var.team_name == "owners" ? 0 : 1

  access       = "write"
  team_id      = data.tfe_team.team.id
  project_id   = tfe_project.project.id
}
