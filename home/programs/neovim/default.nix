{ pkgs, config, ... }:

let 
 pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  home.packages = [
    pkgsUnstable.neovim
  ];

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink ./nvim;
}
