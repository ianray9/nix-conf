{ lib, ... }:
{
  imports = [
    ./tmux.nix
    ./superfile
  ];

  config.my.cli = {
    tmux.enable = lib.mkDefault true;
    superfile.enable = lib.mkDefault true;
  };
}
