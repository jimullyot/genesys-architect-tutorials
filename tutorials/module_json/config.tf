########### JSON Tutorial Flows ###########
terraform {
  required_version = "~> 1.2.7"
  required_providers {
    genesyscloud = {
      source  = "mypurecloud/genesyscloud"
      version = "~> 1.8.0"
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
  oauthclient_id     = var.oauthClientId
  oauthclient_secret = var.oauthClientSecret
  aws_region         = var.aws_region
}

locals {
  studentFlowName = join("", ["Tutorial-", var.studentFirstName, "-JSON-Demo-01"])
}

resource "genesyscloud_flow" "Totorial-JSON-Demo-01" {
  filepath = "https://raw.githubusercontent.com/jimullyot/genesys-architect-tutorials/main/tutorials/module_json/flows/Totorial-JSON-Demo-01.yaml"
  file_content_hash = "b256d5d19e3977f411b924d738f453b6d0aca88d"
  substitutions = {
    flow_name          =  join("", ["Tutorial-", var.studentFirstName, "-JSON-Demo-01"])
    student_first_name = local.studentFlowName
  }
}