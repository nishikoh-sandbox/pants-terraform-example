provider "random" {
  version = "3.6.2"
}

resource "random_id" "id" {
  keepers = {
    inpput_text = var.input_text
  }
  byte_length = 7
}

variable "input_text" {
  type    = string
  default = "default"
}
