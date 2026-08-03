{ pkgs, ... }:
{
  home.stateVersion = "26.05";

  programs = {
    git.settings.user = {
      name = "ianray9";
      email = "ianrayburn9@gmail.com";
    };

    home-manager.enable = true;
  };
}
