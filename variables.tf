variable "org_name" {
  type        = string
  description = "Name of an existing Organization to use."
}

variable "varset_name" {
  type        = string
  description = "Name of an existing Variable Set to use."
}

variable "project_name" {
  type        = string
  description = "Name of the Project to create and / or manage."
}

variable "workspace_configurations" {
  type        = map
  description = "Names and triggers of the Workspaces to create and / or manage."

  default = {
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

variable "team_name" {
  type        = string
  description = "Name of an existing Team to assign to the Workspaces. The default \"owners\" Team does not need Team Access assignments, and this condition has been configured automatically in the code."
  default     = "owners"
}
