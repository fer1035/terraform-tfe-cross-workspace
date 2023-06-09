# terraform-tfe-cross-workspace

A Terraform module to create Workspaces that can trigger other Workspaces in a Project, with shared credentials. This needs to be run in an existing Workspace, which will govern the Project and Workspaces created by the module. Each Run Trigger will trigger Runs in the target Workspace when the source Workspace has completed Apply successfully.

## Workflow

![Full design workflow](https://raw.githubusercontent.com/fer1035/terraform-tfe-cross-workspace/main/images/cross_workspace.png "Full design workflow")

## Prerequisites

- An existing Organization.
- An existing Workspace in which to run the module.
- A **TFE_TOKEN** environment variable in the existing Workspace with sufficient privileges to manage all of the components described here.

## Example Definitions

By default, the module deploys 1 Project with no Variable Set, no Team assignment, and no Workspace.

- To assign Variable Sets to the Project

    ```
    variable_sets = [
      "credentials_0",
      "credentials_1"
    ]
    ```

- To assign Teams and their access levels to the Project

    ```
    teams = {
      maintainers = "maintain"
      engineers   = "write"
      users       = "read"
    }
    ```

- To define Workspaces and their Run Trigger source Workspaces (***null*** means no trigger)

    ```
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
    ```

## How To Use The Module In Your Organization

- Fork the [source repository](https://github.com/fer1035/terraform-tfe-cross-workspace) for this module.
- Publish the Module in your Registry using the new repository as the source.
- Customize the sample code in [examples](https://github.com/fer1035/terraform-tfe-cross-workspace/tree/main/examples) to call the module and create the resources.

## Sample Implementation For A VCS-Driven Workflow

- Module call to create the Terraform environment:

    *main.tf*
    ```
    module "cross_workspace" {
      source  = "app.terraform.io/my-org/cross-workspace/tfe"

      org_name     = "my-org"
      project_name = "my-project"

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
      value = module.cross_workspace.workspaces
    }

    ```

- Workspace 0 code to configure parameters:

    *main.tf*
    ```
    variable "parameters" {
      default = {}
    }

    output "parameters" {
      value = var.parameters
    }

    ```

    *terraform.tfvars*
    ```
    parameters = {
      bucket_1 = {
        name          = "my-bucket-1"
        force_destroy = true
        tags = {
          Name = "My bucket 1"
          tier = "dev"
        }
      }
      bucket_2 = {
        name          = "my-bucket-2"
        force_destroy = true
        tags = {
          Name = "My bucket 2"
          tier = "dev"
        }
      }
    }

    ```

- Workspace 1 code to be triggered by changes in Workspace 0:

    *main.tf*
    ```
    resource "aws_s3_bucket" "bucket" {
      for_each = local.buckets.parameters

      bucket        = each.value.name
      force_destroy = each.value.force_destroy
      tags          = each.value.tags
    }

    output "bucket_names" {
      value = {
        for i, j in aws_s3_bucket.bucket : i => j.id
      }
    }

    output "bucket_arns" {
      value = {
        for i, j in aws_s3_bucket.bucket : i => j.arn
      }
    }

    output "bucket_tags" {
      value = {
        for i, j in aws_s3_bucket.bucket : i => j.tags
      }
    }

    ```

    *parameters.tf*
    ```
    data "tfe_outputs" "parameters" {
      organization = "my-org"
      workspace    = "workspace_0"
    }

    locals {
      buckets = nonsensitive(data.tfe_outputs.parameters.values)
    }

    ```

    *versions.tf*
    ```
    terraform {
      required_version = "~> 1.0"
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 4.0"
        }
        tfe = {
          source  = "hashicorp/tfe"
          version = "0.44.1"
        }
      }
    }

    provider "aws" {
      region = "us-east-1"
    }

    ```

- Workspace 2 code to be triggered by changes in Workspace 1:

    *main.tf*
    ```
    resource "aws_s3_bucket" "triggered" {
      for_each = local.buckets.bucket_names

      bucket        = "triggered-${each.value}"
      force_destroy = true
    }

    output "bucket_names" {
      value = {
        for i, j in aws_s3_bucket.triggered : i => j.id
      }
    }

    ```

    *parameters.tf*
    ```
    data "tfe_outputs" "triggered" {
      organization = "my-org"
      workspace    = "workspace_1"
    }

    locals {
      buckets = nonsensitive(data.tfe_outputs.triggered.values)
    }

    ```

    *versions.tf*
    ```
    terraform {
      required_version = "~> 1.0"
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 4.0"
        }
        tfe = {
          source  = "hashicorp/tfe"
          version = "0.44.1"
        }
      }
    }

    provider "aws" {
      region = "us-east-1"
    }

    ```

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
| <a name="input_teams"></a> [teams](#input\_teams) | Names and permissions of the Teams for the Project to create and / or manage. See documentation for example definition. | `map(any)` | `{}` | no |
| <a name="input_variable_sets"></a> [variable\_sets](#input\_variable\_sets) | Variable Sets to assign to the Project to create and / or manage. See documentation for example definition. | `list(string)` | `[]` | no |
| <a name="input_workspace_configurations"></a> [workspace\_configurations](#input\_workspace\_configurations) | Names and triggers of the Workspaces to create and / or manage. See documentation for example definition. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_environment"></a> [environment](#output\_environment) | Environment data (map). |
