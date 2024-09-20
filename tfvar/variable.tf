variable "instances" {
    type = map

}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Terraform = "true"
    }
  
}

variable "tags" {
    type = map
}

variable "environment" {
  
}