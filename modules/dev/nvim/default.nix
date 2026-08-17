{ pkgs, lib, config, ... }:
{
  options.my.dev.nvim.enable = lib.mkEnableOption "nvim";

  config = lib.mkIf config.my.dev.nvim.enable {
    programs.neovim = {
      enable = true;

      defaultEditor = true;
      viAlias = true;

      extraPackages = with pkgs; [
        nodejs
        go
      ];
    };

    xdg.configFile."nvim".source = ./config;
  };
}
