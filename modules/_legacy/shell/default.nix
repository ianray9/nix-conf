{ lib, ... }:
{
  imports = [
    ./zsh.nix
    ./aliases.nix
    ./utils.nix
  ];

  config.my.shell.zsh.enable = lib.mkDefault true;
}
