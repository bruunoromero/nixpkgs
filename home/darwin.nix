{ ... }:

{
  imports = [
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/Atemu/home-manager/e6d905336181ed8f98d48a1f6c9965b77f18e304/modules/targets/darwin.nix";
      sha256 = "0lsa8ncwvv5qzar2sa8mxblhg6wcq5y6h9ny7kgmsby4wzaryz67";
    })
  ];

  darwin.installApps = true;
}
