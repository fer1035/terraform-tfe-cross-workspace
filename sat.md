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
| [tfe_run_trigger.trigger_0_1](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/run_trigger) | resource |
| [tfe_team_access.team_access](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/team_access) | resource |
| [tfe_team_project_access.project_access](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/team_project_access) | resource |
| [tfe_workspace.workspace](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/workspace) | resource |
| [tfe_team.team](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/data-sources/team) | data source |
| [tfe_variable_set.variable_set](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/data-sources/variable_set) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Name of an existing Organization to use. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the Project to create and / or manage. | `string` | n/a | yes |
| <a name="input_team_name"></a> [team\_name](#input\_team\_name) | Name of an existing Team to assign to the Workspaces. The default "owners" Team does not need Team Access assignments, and this condition has been configured automatically in the code. | `string` | `"owners"` | no |
| <a name="input_varset_name"></a> [varset\_name](#input\_varset\_name) | Name of an existing Variable Set to use. | `string` | n/a | yes |
| <a name="input_workspace_configurations"></a> [workspace\_configurations](#input\_workspace\_configurations) | Names and triggers of the Workspaces to create and / or manage. | `map` | <pre>{<br>  "workspace_0": {<br>    "trigger_source": null<br>  },<br>  "workspace_1": {<br>    "trigger_source": "workspace_0"<br>  },<br>  "workspace_2": {<br>    "trigger_source": "workspace_1"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace"></a> [workspace](#output\_workspace) | Workspace data (map). |
