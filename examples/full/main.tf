module "cross-workspace" {
  source  = "app.terraform.io/my-org/cross-workspace/tfe"
  version = "1.2.1"

  org_name         = "my-org"
  project_name     = "my-project"
  varset_name      = "my-variables"
  team_name        = "my-team"

  workspace_configurations = {
    workspace_0 = {
      trigger_source = null
    }
    workspace_1 = {
      trigger_source = "workspace_0"
    }
    workspace_2 = {
      trigger_source = "workspace_1"
    }
  }
}

output "my-workspaces" {
  value = module.cross-workspace.workspace
}
