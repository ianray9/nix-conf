{ ... }:
{
  programs.git = {
    enable = true;

    userName = "ianray9";
    userEmail = "ianrayburn9@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";

      status = {
        branch = true;
        showStash = true;
      };

      pull.rebase = false;

      push.autoSetupRemote = true;

      rerere.enabled = true;

      core.editor = "nvim";
      url."https://github.com/ianray9".insteadOf = "ianray9:";
    };
  };
}
