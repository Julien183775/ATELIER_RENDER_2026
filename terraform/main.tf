terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = ">= 1.7.0"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key
  owner_id = var.render_owner_id
}

variable "github_actor" {
  description = "GitHub username"
  type        = string
}

resource "render_web_service" "flask_app" {
  name   = "flask-render-iac-${var.github_actor}"
  plan   = "free"
  region = "frankfurt"
  runtime_source = {
    image = {
      image_url = var.image_url
      tag       = var.image_tag
    }
  }
  env_vars = {
    ENV = {
      value = "production"
    }
    DATABASE_URL = {
      value = "postgresql://postgres_julien_user:XoLZLFT8fI7VAKOlms1RNKQjyw5NvxU8@dpg-d8pdd4j6sc1c73cl484g-a/postgres_julien"
    }
  }
}

resource "render_web_service" "adminer" {
  name   = "adminer-${var.github_actor}"
  plan   = "free"
  region = "frankfurt"
  runtime_source = {
    image = {
      image_url = "docker.io/library/adminer"
      tag       = "latest"
    }
  }
  env_vars = {
    PORT = {
      value = "8080"
    }
  }
}
