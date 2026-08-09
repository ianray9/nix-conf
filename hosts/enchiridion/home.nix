{ lib, ... }:
{
  imports = [
    ../../users/stanton/home.nix
    ../../modules/llms
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

    llms.llama-cpp = {
      cuda = false;
    };
  };
}
