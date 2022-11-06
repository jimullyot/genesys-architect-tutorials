terraform {
  required_version = "~> 1.2.7"
  required_providers {
    genesyscloud = {
      source  = "mypurecloud/genesyscloud"
      version = "~> 1.5.0"
    }
  }
}

variable "studentFirstName" {
  type = string
}

variable "oauthClientId" {
  type = string
}

variable "oauthClientSecret" {
  type = string
}

variable "aws_region" {
  type = string
  default = "dca"
}

provider "genesyscloud" {
  oauthclient_id = var.oauthClientId
  oauthclient_secret = var.oauthClientSecret
  aws_region = var.aws_region
}

resource "genesyscloud_flow" "Totorial-JSON-Demo-01" {
  filepath = "https://github.com/jimullyot/genesys-architect-tutorials/blob/205f1e021414fc2f6a2f5b3a654fda13a0d44756/example-flows-json/JSON/Totorial-JSON-Demo-01.yaml"
  substitutions = {
    flow_name  =  join("", "Tutorial-", var.studentFirstName, "-JSON-Demo-01")
    student_first_name = var.studentFirstName
  }
}