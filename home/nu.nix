{ pkgs, ... }:

{
  home.packages = [
    pkgs.awscli
    pkgs.aws-iam-authenticator
    pkgs.tektoncd-cli
    pkgs.kubectl

    pkgs.wget
    pkgs.coreutils-prefixed
    pkgs.gettext
    pkgs.binutils
    pkgs.diffutils
    pkgs.ed
    pkgs.findutils
    pkgs.gawk
    pkgs.gnused
    pkgs.gnutar
    pkgs.which
    pkgs.gnutls
    pkgs.gnugrep
    pkgs.screen
    pkgs.yubikey-manager
    pkgs.wdiff
    pkgs.gzip
  ];
}
