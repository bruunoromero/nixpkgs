{ pkgs, lib, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [ "~/.config/alacritty/catppuccin/catppuccin-mocha.yml" ];
      env.TERM = "xterm-256color";
      window = {
        padding = {
          x = 12;
          y = 12;
        };
        startup_mode = "Fullscreen";
      };
      font = {
        normal = {
          family = "JetBrainsMonoNL Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMonoNL Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMonoNL Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMonoNL Nerd Font";
          style = "Bold Italic";
        };
        size = 15;
      };
    };
  };

  xdg.configFile."alacritty/catppuccin".source = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "alacritty";
    rev = "3c808cbb4f9c87be43ba5241bc57373c793d2f17";
    sha256 = "sha256-w9XVtEe7TqzxxGUCDUR9BFkzLZjG8XrplXJ3lX6f+x0=";
  };
}
