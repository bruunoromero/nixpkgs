{ ... }:

{
  homebrew = {
    enable = true;
    onActivation = { cleanup = "zap"; };
    taps = [
      "keith/formulae"
      "homebrew/services"
      "koekeishiya/formulae"
      "kidonng/homebrew-malt"
      "planetscale/homebrew-tap"
    ];
    brews = [
      {
        name = "yabai";
        start_service = true;
      }
      {
        name = "skhd";
        start_service = true;
      }
      "bash"
      "pscale"
      "coreutils"
      "cocoapods"
      "gnu-sed"
      "watch"
      "sqlite"
      "awslogs"
      "elixir-ls"
      "crystal"
      "flyctl"
      "luarocks"
      "reminders-cli"
      "task"
    ];
    casks = [ "arc" "notion" "brave-browser" "obsidian" ];
  };
}
