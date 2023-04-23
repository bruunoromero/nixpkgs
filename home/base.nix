{ config, pkgs, ... }:

{
  home.stateVersion = "22.11";

  home.sessionVariables = {
    TERMINFO_DIRS = "${pkgs.kitty.terminfo.outPath}/share/terminfo";
  };

  programs.home-manager.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  xdg = {
    enable = true;
  };
}
