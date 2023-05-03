resource "tfe_workspace" "workspace_0" {
  name         = var.workspace_0_name
  organization = var.org_name
  project_id   = tfe_project.project.id
}

resource "tfe_workspace" "workspace_1" {
  name         = var.workspace_1_name
  organization = var.org_name
  project_id   = tfe_project.project.id
}

resource "tfe_workspace" "workspace_2" {
  name         = var.workspace_2_name
  organization = var.org_name
  project_id   = tfe_project.project.id
}

resource "tfe_team_access" "workspace_0_access" {
  count = var.team_name == "owners" ? 0 : 1

  access       = "write"
  team_id      = data.tfe_team.team.id
  workspace_id = tfe_workspace.workspace_0.id

  depends_on = [tfe_workspace.workspace_0]
}

resource "tfe_team_access" "workspace_1_access" {
  count = var.team_name == "owners" ? 0 : 1

  access       = "write"
  team_id      = data.tfe_team.team.id
  workspace_id = tfe_workspace.workspace_1.id

  depends_on = [tfe_workspace.workspace_1]
}

resource "tfe_team_access" "workspace_2_access" {
  count = var.team_name == "owners" ? 0 : 1

  access       = "write"
  team_id      = data.tfe_team.team.id
  workspace_id = tfe_workspace.workspace_2.id

  depends_on = [tfe_workspace.workspace_2]
}
