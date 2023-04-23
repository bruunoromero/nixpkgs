{ pkgs, ... }:

let 
 pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  home.packages = [
    pkgsUnstable.zig
    pkgsUnstable.zls
  ];
}
