{ pkgs, ... }:

{
  home.packages = [
    pkgs.ocaml
    pkgs.dune_3
    pkgs.opam
  ];
}
