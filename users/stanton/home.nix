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

  programs = {
    git = {
      userName = "ianray9";
      userEmail = "ianrayburn9@gmail.com";
    };

    home-manager.enable = true;
  };
}
