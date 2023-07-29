{ pkgs, xdg, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    escapeTime = 0;
    baseIndex = 1;
    terminal = "xterm-256color";
    mouse = true;
    extraConfig = ''
      set-option -ga terminal-overrides ",xterm-256color:Tc"

      set -g @plugin "catppuccin/tmux"
      set -g @plugin "tmux-plugins/tpm"
      set -g @plugin "jimeh/tmuxifier"
      set -g @plugin "christoomey/vim-tmux-navigator"
      set -g @plugin "tmux-plugins/tmux-copycat"
      set -g @plugin "tmux-plugins/tmux-yank"
      set -g @plugin "tmux-plugins/tmux-open"

      set -g @catppuccin_flavour "mocha"

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf
      bind -T copy-mode-vi v send -X begin-selection

      run '~/.tmux/plugins/tpm/tpm'
    '';
  };

  home.file.".tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
    owner = "tmux-plugins";
    repo = "tpm";
    rev = "v3.1.0";
    sha256 = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";
  };
}
