{ config, lib, pkgs, ... }:
{
  config = lib.mkIf (config.my.desktop.terminal == "ghostty") {
    programs.ghostty = {
      enable = true;
      package = pkgs.ghostty-bin;
      settings = {
        theme = "everforest-dark";
        background-opacity = 0.9;

        font-size = 16;
        font-family = "JetBrains Mono";
        font-feature = "-calt"; # disable non ascii ==, !=, et cetera
        font-thicken = true;
        font-thicken-strength = 120;

        mouse-hide-while-typing = true;

        cursor-style = "block";
        shell-integration-features = "no-cursor";

        #command = "/run/current-system/sw/bin/tmux";
        # keybind = [
        # ];
      };
    };

    xdg.configFile."ghostty/themes".source = ./themes;
  };
}
