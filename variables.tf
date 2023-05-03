variable "org_name" {
  type        = string
  description = "Name of an existing organization to use."
}

variable "varset_name" {
  type        = string
  description = "Name of an existing Variable Set to use."
}

variable "project_name" {
  type        = string
  description = "Name of the project to create and / or manage. Only a-z, A-Z, and 0-9 are allowed for the project name, beginning with a letter."

  validation {
    condition     = can(regex("^[A-Za-z]+[A-Za-z0-9]*$", var.project_name))
    error_message = "Only a-z, A-Z, and 0-9 are allowed for the project name, beginning with a letter."
  }
}

variable "workspace_0_name" {
  type        = string
  description = "Name of the 0th workspace to create and / or manage."
}

variable "workspace_1_name" {
  type        = string
  description = "Name of the 1st workspace to create and / or manage."
}

variable "workspace_2_name" {
  type        = string
  description = "Name of the 2nd workspace to create and / or manage."
}

variable "team_name" {
  type        = string
  description = "Name of an existing team to assign to the workspaces. The default \"owners\" team does not need Team Access assignment, and this condition has been configured automatically in the code."
  default     = "owners"
}
