{ pkgs, ... }:

{
  nix.package = pkgs.nix;
  nix.gc.automatic = true;

  system.stateVersion = 4;

  system.keyboard = { enableKeyMapping = true; };

  system.defaults.NSGlobalDomain = {
    KeyRepeat = 1;
    InitialKeyRepeat = 10;
    AppleFontSmoothing = 2;
    AppleShowScrollBars = "WhenScrolling";
    AppleInterfaceStyleSwitchesAutomatically = true;
  };
}
