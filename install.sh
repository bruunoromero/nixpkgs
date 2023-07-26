TERM=xterm-256color darwin-rebuild switch -I "darwin-config=$HOME/nixpkgs/configuration.nix"
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
doom install
