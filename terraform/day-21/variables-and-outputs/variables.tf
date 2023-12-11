variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
  default     = "t2.micro"
}
variable "image_id" {
  description = "Image Id"
  type        = string
  default     = "ami-0230bd60aa48260c6"
}
