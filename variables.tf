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

variable "workspace_0_name" {
  type        = string
  description = "Name of the 0th Workspace to create and / or manage."
}

variable "workspace_1_name" {
  type        = string
  description = "Name of the 1st Workspace to create and / or manage."
}

variable "workspace_2_name" {
  type        = string
  description = "Name of the 2nd Workspace to create and / or manage."
}

variable "team_name" {
  type        = string
  description = "Name of an existing Team to assign to the Workspaces. The default \"owners\" Team does not need Team Access assignments, and this condition has been configured automatically in the code."
  default     = "owners"
}
