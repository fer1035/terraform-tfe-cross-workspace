module "cross-workspace" {
  source  = "app.terraform.io/my-org/cross-workspace/tfe"
  version = "1.5.0"

  org_name         = "my-org"
  project_name     = "my-project"

  variable_sets = [
    "my_credentials_1",
    "my_credentials_2"
  ]

  teams = {
    my_engineers = "write"
    my_users     = "read"
  }

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
  value = module.cross-workspace.workspaces
}
