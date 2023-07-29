TERM=xterm-256color darwin-rebuild switch -I "darwin-config=$HOME/nixpkgs/configuration.nix"
git clone https://github.com/blampe/taskwarrior-reminders ~/.config/taskwarrior-reminders && cd ~/.config/taskwarrior-reminders && make install
