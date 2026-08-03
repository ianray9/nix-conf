{ lib, pkgs, config, ... }:
{
  imports = [
    ./options.nix
  ];

  config = lib.mkIf config.my.packages.enable {
    home.packages = with pkgs; [
      bat
      curl
      glow
      jq
      ripgrep
      tree
      wget
    ];
  };
}
