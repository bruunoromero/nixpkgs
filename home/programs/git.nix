{ pkgs, ... }:

let
  user = import ../../user.nix { };
in
{
  programs.gh = {
    enable = true;
    settings = {
      prompt = "enabled";
      git_protocol = "https";
      aliases = {
        co = "pr checkout";
      };
    };
  };

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = user.name;
    userEmail = user.email;
    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
    };
    signing = {
      key = user.gpgKey;
      signByDefault = true;
    };
    lfs = {
      enable = true;
      skipSmudge = true;
    };
    extraConfig = {
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
