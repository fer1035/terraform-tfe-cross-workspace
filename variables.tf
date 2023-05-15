variable "org_name" {
  type        = string
  description = "Name of an existing Organization to use."
}

variable "project_name" {
  type        = string
  description = "Name of the Project to create and / or manage."
}

variable "workspace_configurations" {
  type        = map(any)
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

variable "variable_sets" {
  type        = list(string)
  description = "Variable Sets to assign to the Project to create and / or manage."

  default = [null]

  /* default = [
    "credentials_0",
    "credentials_1"
  ] */
}

variable "teams" {
  type        = map(any)
  description = "Names and permissions of the Teams for the Project to create and / or manage."

  default = {
    owners = {
      access = null
    }
  }

  /* default = {
    maintainers = {
      access = "maintain"
    }
    engineers = {
      access = "write"
    }
    users = {
      access = "read"
    }
  } */
}
