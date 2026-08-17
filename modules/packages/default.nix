{ lib, pkgs, config, ... }:
{
  imports = [
    ./options.nix
  ];

  config = lib.mkIf config.my.packages.enable {
    home.packages = with pkgs; [
      bat
      curl
      fd
      glow
      jq
      ripgrep
      tree
      wget
    ];

    programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
        truecolor = true;
        color_theme = "Default";
      };
    };
  };
}
