{ pkgs, ... }:

let
  mod = "shift + alt";
in
{
  services.nix-daemon.enable = true;

  # services.yabai = {
  #   enable = true;
  #   package = pkgs.yabai;
  #   config = {
  #     layout = "bsp";
  #     window_gap = 6;
  #     top_padding = 6;
  #     left_padding = 6;
  #     right_padding = 6;
  #     bottom_padding = 6;
  #     window_placement = "second_child";
  #   };
  # };

  # services.skhd = {
  #   enable = true;
  #   package = pkgs.skhd;
  #   skhdConfig = ''
  #     ${mod} - f : yabai -m window --toggle zoom-fullscreen
  #
  #     ${mod} - h : yabai -m window --focus west
  #     ${mod} - j : yabai -m window --focus south
  #     ${mod} - k : yabai -m window --focus north
  #     ${mod} - l : yabai -m window --focus east
  #
  #     ${mod} - r : yabai -m space --rotate 90
  #
  #     ${mod} + ctrl - r : ${pkgs.skhd}/bin/skhd --reload
  #   '';
  # };
}
