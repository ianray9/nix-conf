{ lib, ... }:
{
  imports = [
    ../../modules/shell
    ../../modules/cli
    ../../modules/dev
    ../../modules/desktop
    ../../modules/packages
    ../../modules/core

    ../../modules/platforms

    ../../users/stanton/home.nix
  ];

  my = {
    desktop = {
      terminal = lib.mkDefault "ghostty";
      launcher = lib.mkDefault "vicinae";
      wm = lib.mkDefault "aerospace";
    };

    platform = {
      rebuildCmd = "sudo darwin-rebuild switch --flake ~/.config/nix";
      clipboardCmd = "pbcopy";
    };
  };
}
