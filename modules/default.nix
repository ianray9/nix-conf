{ lib, ... }:
{
  imports = [
    ./options.nix
    ./git.nix
  ];

  config.my.core.git.enable = lib.mkDefault true;
}
