{ pkgs, ... }:
{
  imports = [
    ../../modules/cli

    ../../modules/programs/ghostty
    ../../modules/programs/nvim
    ../../modules/programs/tmux
    ../../modules/programs/git
    ../../modules/programs/zsh
    ../../modules/programs/superfile
    ../../modules/programs/vicinae
  ];

  home.stateVersion = "26.05";

  programs = {
    git.settings.user = {
      name = "ianray9";
      email = "ianrayburn9@gmail.com";
    };

    home-manager.enable = true;
  };
}
