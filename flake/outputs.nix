inputs@{ nixpkgs, ... }:
let
  lib = nixpkgs.lib;

  versions = import ./versions.nix;
  hosts = import ./hosts.nix;
  users = import ./users.nix;

  mkHost = import ./lib/mkHost.nix {
    inherit
      inputs
      versions
      hosts
      users
      ;
  };
in
{
  nixosConfigurations = lib.mapAttrs (name: _: mkHost name) hosts;
}
