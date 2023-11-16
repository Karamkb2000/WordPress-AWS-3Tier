variable "region" {
  type = string
  default = "eu-central-1"
}

variable "config" {
  type    = string
  default = "~/.aws/config"
}

variable "credentials" {
  type    = string
  default = "~/.aws/credentials"
}

variable "my_ip" {
  description = "ip address"
  type        = string
  default     = "176.29.42.121"
}

variable "zone_one" {
  description = "region"
  type        = string
  default     = "eu-central-1a"
}

variable "zone_two" {
  description = "region"
  type        = string
  default     = "eu-central-1b"
}
