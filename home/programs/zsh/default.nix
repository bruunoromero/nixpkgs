{ pkgs, ... }:

{
  home.packages = [
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
    pkgs.zsh-completions
    pkgs.zsh-vi-mode

  ];

  programs.command-not-found = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    initExtra = ''
      fpath=(${pkgs.zsh-completions}share/zsh/site-functions $fpath)

      ${builtins.readFile ./zshrc}
    '';
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "command-not-found"
      ];
    };
    shellAliases = {
      drs = "darwin-rebuild switch";
      gc = "sudo nix-collect-garbage -d";
      lg = "lazygit";
      cat = "bat";
      cp = "cp -iv";
      mv = "mv -iv";
      n = "ranger";
    };
  };
}
