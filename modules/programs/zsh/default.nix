{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh.enable = false;

    enableCompletion = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
    };

    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };

    shellAliases = {
      ls = "ls --color";
      la = "ls --color -lah";
      gs = "git status";
      ".." = "cd ..";
      pub-ip = "curl ipinfo.io/ip";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    initContent = ''
      autoload -Uz compinit
      compinit -d ~/.cache/zsh/zcompdump

      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    '';
  };

  home.file.".p10k.zsh".source = ./p10k.zsh;
}
