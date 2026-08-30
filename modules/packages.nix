{ ... }:
{
  flake.homeModules.packages = { lib, pkgs, config, ... }: {
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
