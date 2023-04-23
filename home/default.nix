{ ... }:

let
  user = import ../user.nix { };
in
{

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  home-manager.users.${user.name} = {
    imports = [
      ./darwin.nix
      ./base.nix

      ./misc.nix

      ./nu.nix

      ./dev/ocaml.nix
      ./dev/haskell.nix
      ./dev/elixir.nix
      ./dev/java.nix
      ./dev/clojure.nix
      ./dev/node.nix
      ./dev/python.nix
      ./dev/lua.nix
      ./dev/go.nix
      ./dev/rust.nix
      ./dev/zig.nix

      ./programs/neovim
      ./programs/direnv.nix
      ./programs/ranger.nix
      ./programs/git.nix
      ./programs/starship.nix
      ./programs/bat.nix
      ./programs/exa.nix
      ./programs/fzf.nix
      ./programs/kitty.nix
      ./programs/zsh
    ];
  };
}
