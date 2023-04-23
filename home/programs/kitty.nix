{ config, lib, pkgs, ... }:

with lib;

let
  pkgsUnstable = import <nixpkgs-unstable> {};
  user = import ../user.nix { };
  theme = "Catppuccin-Frappe";
in
{
  programs.kitty = {
    enable = true;
    package = pkgsUnstable.kitty;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 15;
    };
    keybindings = {
      "alt+m" = "send_text all \\x1bm";
      "ctrl+j" = "kitten pass_keys.py neighboring_window bottom ctrl+j";
      "ctrl+k" = "kitten pass_keys.py neighboring_window top ctrl+k";
      "ctrl+h" = "kitten pass_keys.py neighboring_window left ctrl+h";
      "ctrl+l" = "kitten pass_keys.py neighboring_window right ctrl+l";
    };
    settings = {
      enabled_layouts = "splits,stack";
      confirm_os_window_close = 0;
      window_padding_width = 14;
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/mykitty";
    };
    extraConfig = ''
      include ${pkgs.kitty-themes}/${
        (head (filter (x: x.name == theme) (builtins.fromJSON
          (builtins.readFile
            "${pkgs.kitty-themes}/themes.json")))).file
      }
    '';
  };
}
