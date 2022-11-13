########### SSML Tutorial Flows ###########
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

resource "genesyscloud_flow" "Genesys-Tutorial-SSML-Demo-Bot-01" {
  filepath = "https://raw.githubusercontent.com/jimullyot/genesys-architect-tutorials/main/tutorials/module_ssml/flows/Genesys-Tutorial-SSML-Demo-Bot-01.yaml"
  file_content_hash = "53ee7551b71b020bcc62ae54ebbe008874291412"
  substitutions = {
    flow_name          = join("", ["Genesys-Tutorial-", var.studentFirstName, "-SSML-Demo-Bot-01"])
    student_first_name = var.studentFirstName
  }
}



resource "genesyscloud_flow" "Genesys-Tutorial-SSML-Demo-01" {
  depends_on = [
    genesyscloud_flow.Genesys-Tutorial-SSML-Demo-Bot-01
  ]
  filepath = "https://raw.githubusercontent.com/jimullyot/genesys-architect-tutorials/main/tutorials/module_ssml/flows/Genesys-Tutorial-SSML-Demo-01.yaml"
  file_content_hash = "2c93b12bc2f55aacff4228aa9caa81d54bba8041"
  substitutions = {
    flow_name                   = join("", ["Genesys-Tutorial-", var.studentFirstName, "-SSML-Demo-01"])
    ssml_tutorial_bot_flow_name = join("", ["Genesys-Tutorial-", var.studentFirstName, "-SSML-Demo-Bot-01"])
    student_first_name          = var.studentFirstName
  }
}
