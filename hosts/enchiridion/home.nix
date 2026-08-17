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

    llms = {
      profile = "m1-32gb";

      backend = {
        type = "lemonade";
        host = "127.0.0.1";
        port = 13305;
      };

      opencode = {
        enable = true;
      };
    };
  };
}

