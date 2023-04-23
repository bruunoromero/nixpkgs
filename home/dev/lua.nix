{ pkgs, ... }:

{
  home.packages = [
    pkgs.lua5_3
    pkgs.lua53Packages.luarocks
    pkgs.stylua
    pkgs.fnlfmt
  ];
}
