{ ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
    };
    taps = [
      "kidonng/homebrew-malt"
      "planetscale/homebrew-tap"
    ];
    brews = [
      "pscale"
      "mysql-client"
      "cocoapods"
      "gnu-sed"
      "watch"
      "sqlite"
      "awslogs"
      "elixir-ls"
      "crystal"
      "flyctl"
    ];
    casks = [
      "warp"
      "notion"
      "brave-browser"
    ];
  };
}
