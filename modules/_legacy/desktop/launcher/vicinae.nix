{ pkgs, lib, config, ... }:
let
  vicinaeConfig = {
    close_on_focus_loss = true;
    consider_preedit = true;
    pop_to_root_on_close = true;
    favicon_service = "twenty";
    search_files_in_root = true;


    launcher_window = {
      opacity = 0.98;
      blur = true;
    };
  };

  vicinaeSettings = {
    global_shortcuts = {
      toggle = "control+SPACE";
    };

    font = {
      normal = {
        size = 12;
        family = "Jetbrains Mono";
      };
    };

    theme = {
      light = {
        name = "vicinae-light";
        icon_theme = "default";
      };

      dark = {
        name = "evergarden-spring";
        icon_theme = "default";
      };
    };

    imports = [ ];
  };

in
{
  config = lib.mkIf (config.my.desktop.launcher == "vicinae") {
    programs.vicinae = lib.mkIf pkgs.stdenv.isLinux {
      enable = true;

      systemd = {
        enable = true;
        autoStart = true;
        # Maybe have to add somewhere else on arch (where ever paths are set)
        # environment = {
        #   USE_LAYER_SHELL = "1";
        # };
      };
    };

    xdg.configFile."vicinae/config.json".text =
      builtins.toJSON vicinaeConfig;

    xdg.configFile."vicinae/settings.json".text = 
      builtins.toJSON vicinaeSettings;
  };
}
