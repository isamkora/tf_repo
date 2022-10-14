variable "cidr_blocks" {
  description = "list of cidr blocks for vpc and subnets"
  type = list(object({
    vpc        = string
    subnet-pub = string
    subnet-pri = string
  }))
}

variable "name_tags" {
  description = "list of tags for vpc and subnets"
  type = list(object({
    vpc        = string
    subnet-pub = string
    subnet-pri = string
    igw        = string
    rt         = string
  }))
}

variable "region" {
  description = "list of regions for vpc and subnets"
  type = list(object({
    main_acc   = string
    subnet1_AZ = string
    subnet2_AZ = string
  }))
}
