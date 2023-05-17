variable "org_name" {
  type        = string
  description = "Name of an existing Organization to use."
}

variable "project_name" {
  type        = string
  description = "Name of the Project to create and / or manage."
}

variable "variable_sets" {
  type        = list(string)
  description = "Variable Sets to assign to the Project to create and / or manage. See documentation for example definition."
  default     = []
}

variable "teams" {
  type        = map(any)
  description = "Names and permissions of the Teams for the Project to create and / or manage. See documentation for example definition."
  default     = {}
}

variable "workspace_configurations" {
  type        = map(any)
  description = "Names and triggers of the Workspaces to create and / or manage. See documentation for example definition."
  default     = {}
}
