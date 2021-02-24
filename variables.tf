/*
__      __        _       _     _           
\ \    / /       (_)     | |   | |          
 \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
  \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
   \  / (_| | |  | | (_| | |_) | |  __/\__ \
    \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/ 
    
*/

########################################################################################################################
# GENERAL
########################################################################################################################

variable "tags" {
  type = map(string)
  default = {
    "Created By" = "Terraform",
    "Spike"      = "Aurora Serverless"
  }
}

########################################################################################################################
# AURORA
########################################################################################################################

variable "allow_major_version_upgrade" {
  description = ""
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = ""
}

variable "cluster_name" {
  description = "The name for this Aurora cluster."
  type        = string
}

variable "deletion_protection" {
  type    = bool
  default = false
}

// Only valid when using 'serverless'
variable "enable_http_endpoint" {
  description = ""
  type        = bool
  default     = false
}

variable "engine" {
  description = "Aurora database engine type. Valid values: aurora | aurora-mysql | aurora-postgresql"
  type        = string
  default     = "aurora-postgresql"
}

// Please refer to the following article when using serverless: 
// https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html
//variable "engine_mode" {
//  description = "Aurora database engine mode. Valid values:  multimaster | parallelquery | provisioned | serverless"
//  type        = string
//  default     = "serverless"
//}

variable "engine_version" {
  description = "Aurora database engine version."
  type        = string
  default     = null
}

variable "master_username" {
  description = "Master DB username."
  type        = string
  default     = "master"
}

variable "scaling_configuration" {
  type = object({
    auto_pause               = bool
    min_capacity             = number
    max_capacity             = number
    seconds_until_auto_pause = number
    timeout_action           = string
  })
  default = {
    auto_pause               = true
    min_capacity             = 2
    max_capacity             = 16
    seconds_until_auto_pause = 300
    timeout_action           = "ForceApplyCapacityChange"
  }
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

//storage_encrypted = true

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted."
  type        = bool
  default     = true
}

########################################################################################################################
# BASTION
########################################################################################################################

variable "bastion_instance_type" {
  type = string
}

variable "bastion_name" {
  description = "The name for the bastion host."
  type        = string
}

variable "bastion_user" {
  type = string
}

########################################################################################################################
# VPC
########################################################################################################################

variable "private_subnet_cidrs" {
  type    = list(string)
  default = []
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = []
}

variable "vpc_cidr" {
  type = string
}