# terraform-tfe-cross-workspace

A Terraform module to create Workspaces that can trigger other Workspaces in a Project, with shared credentials. This needs to be run in an existing Workspace, which will govern the Project and Workspaces created by the module. Each Run Trigger will trigger Runs in the target Workspace when the source Workspace has completed Apply successfully.

The workflow diagram shows a more complete design for a full deployment. This module creates a simpler implementation for demonmstration purposes.

## Workflow

![Full design workflow](https://raw.githubusercontent.com/fer1035/terraform-tfe-cross-workspace/main/images/cross_workspace.png "Full design workflow")

## Prerequisites

- An existing Organization.
- An existing Variable Set.
- An existing Team (the default is **owners**).
- An existing Workspace in which to run the module.
- A **TFE_TOKEN** environment variable in the existing Workspace with sufficient privileges to manage all of the components described here.

## What The Module Creates

- 1 Project containing
    - 3 Workspaces with Write permission to the specified Team
        - Workspace 0
        - Workspace 1
        - Workspace 2
- Run Triggers
    - Workspace 0 triggers Workspace 1
    - Workspace 1 triggers Workspace 2

## How To Use The Module In Your Organization

- Fork the [source repository](https://github.com/fer1035/terraform-tfe-cross-workspace) for this module.
- Publish the Module in your Registry using the new repository as the source.
- Use the sample code in [examples](https://github.com/fer1035/terraform-tfe-cross-workspace/tree/main/images) to call the module and create the resources.

---

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
| [tfe_run_trigger.trigger_1_2](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/run_trigger) | resource |
| [tfe_team_access.workspace_0_access](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/team_access) | resource |
| [tfe_team_access.workspace_1_access](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/team_access) | resource |
| [tfe_team_access.workspace_2_access](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/team_access) | resource |
| [tfe_workspace.workspace_0](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/workspace) | resource |
| [tfe_workspace.workspace_1](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/workspace) | resource |
| [tfe_workspace.workspace_2](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/resources/workspace) | resource |
| [tfe_team.team](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/data-sources/team) | data source |
| [tfe_variable_set.variable_set](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/data-sources/variable_set) | data source |
| [tfe_workspace.workspace_0](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/data-sources/workspace) | data source |
| [tfe_workspace.workspace_1](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/data-sources/workspace) | data source |
| [tfe_workspace.workspace_2](https://registry.terraform.io/providers/hashicorp/tfe/0.44.1/docs/data-sources/workspace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Name of an existing organization to use. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project to create and / or manage. | `string` | n/a | yes |
| <a name="input_team_name"></a> [team\_name](#input\_team\_name) | Name of an existing team to assign to the workspaces. | `string` | `"owners"` | no |
| <a name="input_varset_name"></a> [varset\_name](#input\_varset\_name) | Name of an existing Variable Set to use. | `string` | n/a | yes |
| <a name="input_workspace_0_name"></a> [workspace\_0\_name](#input\_workspace\_0\_name) | Name of the 0th workspace to create and / or manage. | `string` | n/a | yes |
| <a name="input_workspace_1_name"></a> [workspace\_1\_name](#input\_workspace\_1\_name) | Name of the 1st workspace to create and / or manage. | `string` | n/a | yes |
| <a name="input_workspace_2_name"></a> [workspace\_2\_name](#input\_workspace\_2\_name) | Name of the 2nd workspace to create and / or manage. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace_0"></a> [workspace\_0](#output\_workspace\_0) | Workspace 0 data (map). |
| <a name="output_workspace_1"></a> [workspace\_1](#output\_workspace\_1) | Workspace 1 data (map). |
| <a name="output_workspace_2"></a> [workspace\_2](#output\_workspace\_2) | Workspace 2 data (map). |
