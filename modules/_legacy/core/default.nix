{ lib, ... }:
{
  imports = [
    ./git.nix
    # ./ssh.nix
  ];

  config.my.core.git.enable = lib.mkDefault true;
}

