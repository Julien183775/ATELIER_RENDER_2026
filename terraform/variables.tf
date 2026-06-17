variable "render_api_key" {
  description = "Render API key"
  type        = string
  sensitive   = true
}

variable "render_owner_id" {
  description = "Render owner ID"
  type        = string
}

variable "image_url" {
  description = "Docker image URL"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
}

variable "github_actor" {
  description = "GitHub username"
  type        = string
}

variable "database_url" {
  description = "Internal PostgreSQL connection URL"
  type        = string
  sensitive   = true
}
