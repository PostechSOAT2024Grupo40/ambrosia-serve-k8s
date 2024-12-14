variable "lab_role_arn" {
  type        = string
  default     = "arn:aws:iam::851725225519:role/LabRole"
  description = "The ARN of the lab role used on AWS Academy"
}

variable "subnet_ids" {
  type        = list(string)
  default     = ["subnet-09260901517fbc8f7", "subnet-0f137534666122cec", "subnet-0bb9852652d96a262", ]
  description = "The subnet IDs for the EKS cluster"
}

variable "vpc_id" {
  type        = string
  default     = "vpc-01525f58b2e30df1b"
  description = "The default VPC ID"
}

