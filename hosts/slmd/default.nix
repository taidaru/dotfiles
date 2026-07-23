{ stateVersion, hostname, ... }:

{
  imports = [
    ./hardware
    ./config/power.nix
    ../../nixos/base.nix
    ../../nixos/desktop.nix
  ];

  my.powerSave = false;

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}
