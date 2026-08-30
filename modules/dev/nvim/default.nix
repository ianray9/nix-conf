{ ... }:
{
  flake.homeModules.nvim = { pkgs, lib, config, ... }: {
    options.my.nvim.enable = lib.mkEnableOption "nvim";

    config = lib.mkIf config.my.nvim.enable {
      programs.neovim = {
        enable = true;

        defaultEditor = true;
        viAlias = true;

        extraPackages = with pkgs; [
          nodejs
          go
          tree-sitter
        ];
      };

      xdg.configFile."nvim".source = ./config;
    };
  };
}
