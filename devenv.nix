{ pkgs, ... }:

{
  languages.nix.enable = true;
  packages = [
    pkgs.nixfmt
  ];
}
