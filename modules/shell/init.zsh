if [[ $OSTYPE == darwin* && $CPUTYPE == arm64 ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump

bindkey '^ ' autosuggest-accept

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
