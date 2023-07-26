{ ... }:

let
  user = import ./user.nix { };
in
{
  users.users.${user.name} = {
    name = user.name;
    home = user.home;
  };

  nix.settings.trusted-users = [ "bruno.romero" ];
}
