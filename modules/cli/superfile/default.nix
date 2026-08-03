{ lib, config, ... }:
{
  options.my.cli.superfile.enable = lib.mkEnableOption "superfile";

  config = lib.mkIf config.my.cli.superfile.enable {
    programs.superfile.enable = true;

    home.file = {
      "Library/Application Support/superfile/config.toml".source =
        ./config.toml;

      "Library/Application Support/superfile/hotkeys.toml".source =
        ./hotkeys.toml;

      "Library/Application Support/superfile/theme/everforest-dark-medium.toml".source =
        ./themes/everforest-dark-medium.toml;
    };
  };

}
