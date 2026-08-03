{ lib, config, pkgs, ... }:
{
  options.my.shell.zsh.enable =
    lib.mkEnableOption "Zsh";

  config = lib.mkIf config.my.shell.zsh.enable {

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

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];

      initContent = builtins.readFile ./init.zsh;
    };

    home.file.".p10k.zsh".source = ./p10k.zsh;
  };
}
