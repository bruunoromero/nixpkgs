{ pkgs, ... }:

{
  home.packages = [
    pkgs.ocaml
    pkgs.dune_3
    pkgs.opam
    pkgs.ocamlPackages.ocaml-lsp
  ];
}
