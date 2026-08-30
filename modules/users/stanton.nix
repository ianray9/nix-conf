{ self, ... }:
{
  flake.homeModules.stanton = {
    home.stateVersion = "26.05";

    programs = {
      git.settings.user = {
        name = "ianray9";
        email = "ianrayburn9@gmail.com";
      };

      home-manager.enable = true;
    };

    my.git.enable = true;
    my.tmux.enable = true;
    my.superfile.enable = true;
  };
}
