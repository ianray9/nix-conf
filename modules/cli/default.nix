{ pkgs, ... }:
{
  home.packages = with pkgs; [
    curl
    glow
    ripgrep
    tree
    wget
  ];
}

