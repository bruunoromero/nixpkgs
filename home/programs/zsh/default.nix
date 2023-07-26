{ pkgs, ... }:

{
  home.packages = [
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
    pkgs.zsh-completions
    pkgs.zsh-vi-mode

  ];

  programs.command-not-found = { enable = true; };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting = {
        enable = true;
      };
    oh-my-zsh = {
      enable = true;
      plugins = [ "tmux" "command-not-found" "zsh-interactive-cd" ];
      extraConfig = ''
        export ZSH_TMUX_FIXTERM=false
        export ZSH_TMUX_AUTOQUIT=false
        export ZSH_TMUX_AUTOSTART=true

        fpath=(${pkgs.zsh-completions}share/zsh/site-functions $(brew --prefix)/share/zsh/site-functions $fpath)
      '';
    };
    shellAliases = {
      drs = "darwin-rebuild switch";
      gc = "sudo nix-collect-garbage -d";
      lg = "lazygit";
      cat = "bat";
      cp = "cp -iv";
      mv = "mv -iv";
      n = "nnn";
    };
    initExtra = ''
      ${builtins.readFile ./zshrc}
    '';
  };
}
