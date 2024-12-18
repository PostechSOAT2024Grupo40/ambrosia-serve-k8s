variable "lab_role_arn" {
  type        = string
  default     = "arn:aws:iam::851725225519:role/LabRole"
  description = "The ARN of the lab role used on AWS Academy"
}

variable "voclabs_role_arn" {
  type        = string
  default     = "arn:aws:iam::851725225519:role/voclabs"
  description = "The ARN of the voclabs role used on AWS Academy"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The default region"
}
