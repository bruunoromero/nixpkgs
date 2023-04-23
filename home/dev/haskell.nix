
{ pkgs, ... }:

{
  home.packages = [
    pkgs.ghc
    pkgs.haskell-language-server
    pkgs.cabal-install
    pkgs.haskellPackages.hlint
  ];
}
