terraform {
  backend "local" {
    path = "/tmp/tfstate/foo.tfstate"
  }
}


module "name" {
  source     = "../../module"
  input_text = "helloooo"
}
