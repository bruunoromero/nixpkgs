{ pkgs, ... }:

{
  home.packages = [
    pkgs.lua
    pkgs.stylua
    pkgs.fnlfmt
  ];
}
