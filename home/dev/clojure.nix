{ pkgs, ... }:

{
  home.packages = [
    pkgs.leiningen
    pkgs.clojure
    pkgs.babashka
    pkgs.clj-kondo
    pkgs.clojure-lsp
  ];
}
