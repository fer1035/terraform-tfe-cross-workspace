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
  description = "Name of the project to create and / or manage."
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
  description = "Name of an existing team to assign to the workspaces."
  default     = "owners"
}
