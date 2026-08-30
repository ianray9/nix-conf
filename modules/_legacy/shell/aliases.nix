{ config, ... }:
{
  programs.zsh = {
    shellAliases = {
      alias-help = "cat ~/.config/nix/modules/shell/aliases.nix";

      build = config.my.platform.rebuildCmd;

      ls = "ls --color";
      la = "ls --color -lah";
      rm = "rm -I";

      ".." = "cd ..";

      v = "nvim";

      zmv = "zmv -n";
      zmv-e = "zmv";

      gs = "git status";

      pub-ip = "curl ipinfo.io/ip";

      spf = "superfile";
    };

    shellGlobalAliases = {
      nix-conf = "~/.config/nix";
      nvim-conf = "~/.config/nix/modules/dev/nvim/config";

      BUF = "| ${config.my.platform.clipboardCmd}";

      NO_ERROR = "2>/dev/null";
    };
  };
}
