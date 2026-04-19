module "rg" {
  source      = "../child module/rg/yogi/sandeep/jiowale"
  rg-name     = "yogi-rg"
  rg-location = "east us"
}

module "vnet" {
  depends_on = [ module.rg ]
  source        = "../child module/vnet"
  vnet-name     = "yogi-vnet"
  vnet-location = "east us"
}
