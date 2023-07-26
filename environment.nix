{ pkgs, ... }:

{
  environment.systemPackages = [
    (import (fetchTarball https://github.com/cachix/devenv/archive/v0.6.3.tar.gz)).default
  ];

  environment.darwinConfig = "$HOME/nixpkgs/configuration.nix";
  environment.variables.LANG = "en_US.UTF-8";
  environment.variables.LC_ALL = "en_US.UTF-8";
}
