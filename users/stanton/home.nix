{ pkgs, ... }:
{
  imports = [
    ../../modules/cli

    ../../modules/programs/ghostty
    ../../modules/programs/nvim
    ../../modules/programs/tmux
    ../../modules/programs/git
  ];

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
