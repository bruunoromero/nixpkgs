{ ... }:

{
  nixpkgs.overlays = [
    (import ./jdk.nix)
    (import ./nerdfonts.nix)
  ];
}
