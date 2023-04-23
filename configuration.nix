{ ... }:

{
  imports = [
    <home-manager/nix-darwin>

    ./overlays

    ./users.nix
    ./system.nix
    ./services.nix

    ./environment.nix
    ./fonts.nix
    ./brew.nix
    ./programs.nix

    ./home
  ];
}
