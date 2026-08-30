{ ... }:
{
  flake.homeModules.zsh = { lib, config, pkgs, ... }: {
    options.my.zsh.enable = lib.mkEnableOption "Zsh";

    config = lib.mkIf config.my.zsh.enable {
      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
      };

      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = [ "--cmd cd" ];
      };

      programs.zsh = {
        enable = true;

        oh-my-zsh.enable = false;

        sessionVariables = {
          EDITOR = "nvim";
          MANPAGER = "nvim +Man!";
        };

        autocd = true;
        enableCompletion = true;

        syntaxHighlighting.enable = true;

        defaultKeymap = "viins";

        autosuggestion = {
          enable = true;
          strategy = [ "history" "completion" ];
        };

        history = {
          size = 10000;
          save = 10000;
          ignoreDups = true;
          ignoreSpace = true;
          expireDuplicatesFirst = true;
          share = true;
        };

        plugins = [{
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }];

        shellAliases = {
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

        initContent = builtins.readFile ./init.zsh;
      };

      home.file.".p10k.zsh".source = ./p10k.zsh;
    };
  };
}
