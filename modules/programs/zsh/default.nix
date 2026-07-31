{ pkgs, ... }:
let
  UPDATE_CMD =
    if pkgs.stdenv.hostPlatform.isDarwin then
      "sudo darwin-rebuild switch --flake ~/.config/nix"
    else
      "sudo nixos-rebuild switch --flake ~/.config/nix";

  COPY_CMD =
    if pkgs.stdenv.hostPlatform.isDarwin then
      "| pbcopy"
    else
      "| wl-copy";
in
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

    autocd = true;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
    };

    defaultKeymap = "viins";

    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };

    shellAliases = {
      update = UPDATE_CMD;

      ls = "ls --color";
      la = "ls --color -lah";
      ".." = "cd ..";

      gs = "git status";
      pub-ip = "curl ipinfo.io/ip";
      spf = "superfile";
    };

    shellGlobalAliases = {
      nix-conf = "~/.config/nix";
      nvim-conf = "~/.config/nix/modules/programs/nvim/config";
      BUF = COPY_CMD;
      NO_ERROR = "> /dev/null 2>&1";
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

      bindkey '^ ' autosuggest-accept

      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    '';
  };

  home.file.".p10k.zsh".source = ./p10k.zsh;
}
