## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.44.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.44.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_project.project](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/project) | resource |
| [tfe_project_variable_set.project_variable_set](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/project_variable_set) | resource |
| [tfe_run_trigger.run_trigger](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/run_trigger) | resource |
| [tfe_team_project_access.project_access](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/team_project_access) | resource |
| [tfe_workspace.workspace](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/workspace) | resource |
| [tfe_team.team](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/data-sources/team) | data source |
| [tfe_variable_set.variable_set](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/data-sources/variable_set) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Name of an existing Organization to use. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the Project to create and / or manage. | `string` | n/a | yes |
| <a name="input_teams"></a> [teams](#input\_teams) | Names and permissions of the Teams for the Project to create and / or manage. | `map(any)` | <pre>{<br>  "owners": null<br>}</pre> | no |
| <a name="input_variable_sets"></a> [variable\_sets](#input\_variable\_sets) | Variable Sets to assign to the Project to create and / or manage. | `list(string)` | <pre>[<br>  null<br>]</pre> | no |
| <a name="input_workspace_configurations"></a> [workspace\_configurations](#input\_workspace\_configurations) | Names and triggers of the Workspaces to create and / or manage. | `map(any)` | <pre>{<br>  "workspace_0": {<br>    "trigger_source": null<br>  },<br>  "workspace_1": {<br>    "trigger_source": "workspace_0"<br>  },<br>  "workspace_2": {<br>    "trigger_source": "workspace_1"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspaces"></a> [workspaces](#output\_workspaces) | Workspace data (map). |
