terraform {
  required_version = "~> 1.2.7"
}

variable "tutorials" {
  type = string
  default = "json"
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

module "tutorial_json" {
  # count             = tutorials == "module_json" || tutorials == "all") ? 1 : 0
  source            = "./tutorials/module_json"
  aws_region        = var.aws_region
  oauthClientId     = var.oauthClientId
  oauthClientSecret = var.oauthClientSecret
  studentFirstName  = var.studentFirstName
}

module "tutorial_ssml" {
  # count             = tutorials == "module_json" || tutorials == "all") ? 1 : 0
  source            = "./tutorials/module_ssml"
  aws_region        = var.aws_region
  oauthClientId     = var.oauthClientId
  oauthClientSecret = var.oauthClientSecret
  studentFirstName  = var.studentFirstName
}