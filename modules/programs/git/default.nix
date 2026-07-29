{ ... }:
{
  programs.git = {
    enable = true;

    extraConfig = {
      init.defaultBranch = "main";

      status = {
        branch = true;
        showStash = true;
      };

      delta = {
        enable = true;
      };

      pull.rebase = false;

      push.autoSetupRemote = true;

      rerere.enabled = true;

      core.editor = "nvim";
      url."https://github.com/ianray9".insteadOf = "ianray9:";
    };
  };
}
