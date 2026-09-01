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

    my = {
      nix.gc.enable = true;

      git.enable = true;
      tmux.enable = true;
      superfile.enable = true;

      nvim.enable = true;

      zsh.enable = true;

      llms = {
        backend.type = "lemonade";
        llama-cpp.enable = false;

        opencode.docker.enable = true;
        opencode.enable = true;
      };
    };
  };
}
