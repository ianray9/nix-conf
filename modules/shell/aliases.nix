{ config, ... }:
{
  programs.zsh = {
    shellAliases = {
      build = config.my.platform.rebuildCmd;

      ls = "ls --color";
      la = "ls --color -lah";
      rm = "rm -I";

      ".." = "cd ..";

      zmv = "zmv -n";
      zmv-e = "zmv";

      gs = "git status";

      pub-ip = "curl ipinfo.io/ip";

      spf = "superfile";
    };

    shellGlobalAliases = {
      nix-conf = "~/.config/nix";
      nvim-conf =
        "~/.config/nix/modules/programs/nvim/config";

      BUF =
        "| ${config.my.platform.clipboardCmd}";

      NO_ERROR =
        "> /dev/null 2>&1";
    };
  };
}
