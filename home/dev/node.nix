{ pkgs, ... }:

{
  home.packages = [
    pkgs.deno
    pkgs.nodejs
    pkgs.yarn
    pkgs.nodePackages.pnpm
  ];
}
