inputs@{ nixpkgs, ... }:
let
  lib = nixpkgs.lib;

  subdirs = dir: lib.attrNames (lib.filterAttrs (_: t: t == "directory") (builtins.readDir dir));

  hosts = lib.genAttrs (subdirs ../hosts) (name: import ../hosts/${name}/meta.nix);
  users = lib.genAttrs (subdirs ../users) (name: import ../users/${name}/user.nix);

  mkHost = import ./lib/mkHost.nix {
    inherit
      inputs
      hosts
      users
      ;
  };
in
{
  nixosConfigurations = lib.mapAttrs (name: _: mkHost name) hosts;
}
