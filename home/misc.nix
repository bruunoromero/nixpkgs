{ pkgs, ... }:

{
  home.packages = [
    pkgs.nb
    pkgs.fd
    pkgs.jq
    pkgs.ripgrep
    pkgs.glow
    pkgs.docker
    pkgs.zk
    pkgs.taskwarrior
    pkgs.cmake
    pkgs.graphviz

    # Upgrade versions shipped with MacOS
    pkgs.file
    pkgs.gnupatch
    pkgs.less
    pkgs.gnum4
    pkgs.openssh
    pkgs.rsync
    pkgs.unzip
  ];
}
