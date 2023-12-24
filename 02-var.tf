variable "instance_ami" {
    type = string
    description = "instance ami"
    default = "ami-0666c668000b91fcb"
}
variable workspace {
    type = string
    description = "infrastructure environment"
    default = "prod"
}
variable default_region {
    type = string
    description = "infrastructure region"
    default = "eu-west-1"
}
variable instance_size {
    type = string
    description = "ec2 instance size"
    default = "t3.small"
}
