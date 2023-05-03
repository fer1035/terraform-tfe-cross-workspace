data "tfe_workspace" "workspace_0" {
  name         = var.workspace_0_name
  organization = var.org_name
}

data "tfe_workspace" "workspace_1" {
  name         = var.workspace_1_name
  organization = var.org_name
}

data "tfe_workspace" "workspace_2" {
  name         = var.workspace_2_name
  organization = var.org_name
}

output "workspace_0" {
  description = "Workspace 0 data (map)."
  value       = data.tfe_workspace.workspace_0
}

output "workspace_1" {
  description = "Workspace 1 data (map)."
  value       = data.tfe_workspace.workspace_1
}

output "workspace_2" {
  description = "Workspace 2 data (map)."
  value       = data.tfe_workspace.workspace_2
}
