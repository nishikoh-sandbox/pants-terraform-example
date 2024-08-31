terraform {
  backend "local" {
    path = "/tmp/tfstate/bar.tfstate"
  }
}

module "name" {
  source     = "../../module"
  input_text = "world"
}
