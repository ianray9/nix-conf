{ ... }:
{
  flake.homeModules.tmux = { lib, config, pkgs, ... }:
    let
      bg_     = "#2D353B"; # matches terminal background
      fg_     = "#D3C6AA"; # main foreground
      grey_   = "#7A8478"; # muted text / inactive windows
      red_    = "#E67E80";
      yellow_ = "#DBBC7F";
      green_  = "#A7C080";
      blue_   = "#7FBBB3";
      purple_ = "#D699B6";
      aqua_   = "#83C092";
      orange_ = "#E69875";
      act_ = "#A7C080";

      sessionUptime = pkgs.writeShellScriptBin "tmux-session-uptime" ''
        #!/usr/bin/env bash
        created=$1
        now=$(date +%s)
        diff=$(( now - created ))
        d=$(( diff / 86400 ))
        h=$(( (diff % 86400) / 3600 ))
        m=$(( (diff % 3600) / 60 ))
        printf "%dd %02d:%02d" "$d" "$h" "$m"
      '';

      cpuPlugin = pkgs.tmuxPlugins.cpu;
    in
    {
      options.my.tmux.enable = lib.mkEnableOption "tmux";

      config = lib.mkIf config.my.tmux.enable {
        programs.tmux = {
          enable = true;

          extraConfig = ''
          set -g default-terminal "xterm-256color"
          set -ag terminal-overrides ",xterm-256color:RGB"
          set-option -g default-shell ${pkgs.zsh}/bin/zsh
          unbind C-b
          set -g prefix C-s
          bind-key C-s send-prefix

          set -g mouse on

          # vim pane movement
          bind-key h select-pane -L
          bind-key j select-pane -D
          bind-key k select-pane -U
          bind-key l select-pane -R

          setw -g mode-keys vi

          set-option -g bell-action none
          set-option -g status-position top
          set -g status-justify left
          set -g status-interval 2
          set -g status-style "bg=${bg_},fg=${grey_}"

          set -g status-left '#[fg=${bg_},bg=${fg_},bold] ▣#[fg=${bg_},bg=${fg_}] #S ░▒▓#[fg=${red_},bg=${bg_}]'

          setw -g window-status-format "#[fg=${grey_},bg=${bg_}] #I:#W "
          setw -g window-status-current-format "#[fg=${act_},bg=${bg_},bold] ✎#I:#W #[fg=${yellow_},bg=${bg_}]"
          setw -g window-status-separator ""

          set -g status-right '#[fg=${bg_},bg=${red_},bold]▓▒░ ◴ #[fg=${bg_},bg=${red_}]#(${sessionUptime}/bin/tmux-session-uptime #{session_created}) #[fg=${bg_},bg=${yellow_},bold]#[fg=${bg_},bg=${yellow_}] ⚙ #{cpu_percentage} #[fg=${bg_},bg=${aqua_},bold]#[fg=${bg_},bg=${aqua_}] ☰ #{ram_percentage} #[fg=${bg_},bg=${blue_},bold] ☻ ∈#[fg=${bg_},bg=${blue_}] #(whoami)#[fg=${bg_},bg=${blue_},bold]@#h #[fg=${bg_},bg=${aqua_}]'
          set -g status-right-length 100

          set -g pane-border-style "fg=${grey_}"
          set -g pane-active-border-style "fg=${orange_}"
          set -g pane-border-format " #P: #{pane_current_command} "

          set -sg escape-time 0
          set -g base-index 1
          setw -g pane-base-index 1

          run-shell ${cpuPlugin}/share/tmux-plugins/cpu/cpu.tmux
          '';
        };
      };
    };
}
