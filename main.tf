provider "google" {
  region      = "us-east1"
  zone        = "us-east1-b"
  project     = var.project
  credentials = file("creds.json")
}

module "vpc" {
  source                       = "./modules/vpc"
  privatesubnet-mgmt-ip-ranges = var.privatesubnet-mgmt-ip-ranges
  privatesubnet-app-ip-ranges  = var.privatesubnet-app-ip-ranges
}

module "firewall" {
  source                       = "./modules/firewall"
  privatenet                   = module.vpc.privatenet
  privatesubnet-mgmt-ip-ranges = var.privatesubnet-mgmt-ip-ranges
  privatesubnet-app-ip-ranges  = var.privatesubnet-app-ip-ranges
}

module "compute_engine" {
  source             = "./modules/compute_engine"
  privatenet         = module.vpc.privatenet
  privatesubnet-app  = module.vpc.privatesubnet-app
  privatesubnet-mgmt = module.vpc.privatesubnet-mgmt
}
