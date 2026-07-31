{ pkgs, ... }:
{
  programs.superfile = {
    enable = true;

    settings = {
      theme = "everforest-dark-medium";
      transparent_background = true;
    };
  };

  xdg.configFile = {
    "superfile/hotkey.toml".source = ./vim-hotkeys.toml;
  };
}
