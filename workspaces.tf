data "tfe_team" "team" {
  name         = var.team_name
  organization = var.org_name
}

resource "tfe_workspace" "workspace_0" {
  name         = var.workspace_0_name
  organization = var.org_name
}

resource "tfe_workspace" "workspace_1" {
  name         = var.workspace_1_name
  organization = var.org_name
}

resource "tfe_workspace" "workspace_2" {
  name         = var.workspace_2_name
  organization = var.org_name
}

resource "tfe_team_access" "workspace_0_access" {
  access       = "write"
  team_id      = data.tfe_team.team.id
  workspace_id = tfe_workspace.workspace_0.id
}

resource "tfe_team_access" "workspace_1_access" {
  access       = "write"
  team_id      = data.tfe_team.team.id
  workspace_id = tfe_workspace.workspace_1.id
}

resource "tfe_team_access" "workspace_2_access" {
  access       = "write"
  team_id      = data.tfe_team.team.id
  workspace_id = tfe_workspace.workspace_2.id
}
