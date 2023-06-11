module "cross-workspace" {
  source  = "app.terraform.io/my-org/cross-workspace/tfe"
  version = "1.5.2"

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
      tags           = ["mytag-1", "mytag-2"]
    }
    workspace_1 = {
      trigger_source = "workspace_0"
      tags           = ["mytag-1", "mytag-b"]
    }
    workspace_2 = {
      trigger_source = "workspace_1"
      tags           = ["mytag-a", "mytag-b"]
    }
  }
}

output "my-workspaces" {
  value = module.cross-workspace.workspaces
}
