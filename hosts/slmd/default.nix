{ hostname, ... }:

{
  imports = [
    ./hardware
    ./config/power.nix
    ./config/monitors.nix
    ../../nixos/base.nix
    ../../nixos/desktop.nix
  ];

  my.powerSave = false;

  networking.hostName = hostname;

  system.stateVersion = "25.11";
}
