  # isDarwin = pkgs.stdenv.isDarwin;
  # home.sessionVariables = lib.mkIf isDarwin {
  #   VICINAE_PLATFORM = "macos";
  # };
  # home.packages =
  #   [ pkgs.vicinae ]
  #   ++ lib.optionals pkgs.stdenv.isLinux [
  #     pkgs.wl-clipboard
  # ];
{ pkgs, lib, ... }:
let
  tomlFormat = pkgs.formats.toml { };
in
{
  home.packages = lib.optionals pkgs.stdenv.hostPlatform.isLinux [
    pkgs.vicinae
  ];

  xdg.configFile."vicinae/config.toml".source = tomlFormat.generate "config" {
    lib.generators.toTOML {} {

      theme = "system";

      window = {
        width = if pkgs.stdenv.hostPlatform.isDarwin then 720 else 760;
        height = 500;
      };

      clipboard = {
        enabled = true;
        history_size = 100;
      };

      search = {
        show_icons = true;
      };
  };
}
