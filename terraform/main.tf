terraform {
  required_providers {
    railway = {
      source  = "terraform-community-providers/railway"
      version = "0.4.4"
    }
  }
}

provider "railway" {
  token = var.railway_token
}
