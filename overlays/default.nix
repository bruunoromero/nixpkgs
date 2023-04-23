{ ... }:

{
  nixpkgs.overlays = [
    (import ./jdk.nix)
    (import ./yabai.nix)
    (import ./nerdfonts.nix)
  ];
}
