# VPC CIDR
variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for VPC"
}

# Instance tenancy
variable "instance" {
  type        = string
  default     = "default"
  description = "Instance tenancy for VPC"
}

# Public Subnets
variable "publicsubnet1" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Public Subnet 1"
}

variable "publicsubnet2" {
  type        = string
  default     = "10.0.2.0/24"
  description = "Public Subnet 2"
}

# Availability Zones for Public Subnets
variable "Pb_availability_zone1" {
  type        = string
  default     = "us-east-1a"
  description = "AZ for Public Subnet 1"
}

variable "Pb_availability_zone2" {
  type        = string
  default     = "us-east-1b"
  description = "AZ for Public Subnet 2"
}

# Private Subnets
variable "privatesubnet1" {
  type        = string
  default     = "10.0.11.0/24"
  description = "Private Subnet 1"
}

variable "privatesubnet2" {
  type        = string
  default     = "10.0.12.0/24"
  description = "Private Subnet 2"
}

# Availability Zones for Private Subnets
variable "Pv_availability_zone1" {
  type        = string
  default     = "us-east-1a"
  description = "AZ for Private Subnet 1"
}

variable "Pv_availability_zone2" {
  type        = string
  default     = "us-east-1b"
  description = "AZ for Private Subnet 2"
}

# Database Subnets
variable "databasesubnet1" {
  type        = string
  default     = "10.0.21.0/24"
  description = "Database Subnet 1"
}

variable "databasesubnet2" {
  type        = string
  default     = "10.0.22.0/24"
  description = "Database Subnet 2"
}

# Availability Zones for DB Subnets
variable "DB_availability_zone1" {
  type        = string
  default     = "us-east-1a"
  description = "AZ for DB Subnet 1"
}

variable "DB_availability_zone2" {
  type        = string
  default     = "us-east-1b"
  description = "AZ for DB Subnet 2"
}

# Universal Tags
variable "tags" {
  type = map(string)
  default = {
    Environment = "Dev"
    Project     = "VPC-Network"
    CreatedBy   = "Terraform"
  }
  description = "Common tags"
}

# DB Route Destination
variable "dstcidrblock" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Route CIDR Block for DB route"
}
