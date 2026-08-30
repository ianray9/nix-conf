{ config, lib, ... }:
{
  options.my.packages.enable = lib.mkEnableOption "CLI packages";
  config.my.packages.enable = lib.mkDefault true;
}
