{
  inputs,
  versions,
  hosts,
  users,
}:

hostname:

let
  host = hosts.${hostname};
  lib = inputs.nixpkgs.lib;

  unstable = import inputs.nixpkgs-unstable {
    inherit (host) system;
    config.allowUnfree = true;
  };
in

lib.nixosSystem {
  inherit (host) system;

  specialArgs = {
    inherit inputs hostname unstable;
    hostUsers = host.users;
    usersConfig = users;
    stateVersion = versions.system;
  };

  modules = [
    ../../hosts/${hostname}
    inputs.home-manager.nixosModules.default
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = {
          inherit inputs unstable;
          homeStateVersion = versions.home;
        };
        users = lib.genAttrs host.users (name: import ../../users/${name}/home.nix);
      };
    }
  ];
}
