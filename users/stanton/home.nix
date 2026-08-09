{ pkgs, ... }:
{
  home.stateVersion = "26.05";

  imports = [
    ../../modules/shell
    ../../modules/cli
    ../../modules/dev
    ../../modules/desktop
    ../../modules/packages
    ../../modules/core

    ../../modules/platforms
  ];

  programs = {
    git.settings.user = {
      name = "ianray9";
      email = "ianrayburn9@gmail.com";
    };

    home-manager.enable = true;
  };
}
