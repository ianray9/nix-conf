{ pkgs, ... }:
{
  home.packages = with pkgs; [
    curl
    git
    glow
    ripgrep
    tree
    wget
  ];
}

