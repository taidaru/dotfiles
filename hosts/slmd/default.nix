{ hostname, ... }:

{
  imports = [
    ./hardware
    ./config/external-monitor.nix
    ./config/power-save.nix
    ./config/monitors.nix
    ../../nixos/base.nix
    ../../nixos/desktop.nix
  ];

  my.powerSave = false;
  my.externalMonitor = false;

  networking.hostName = hostname;

  system.stateVersion = "25.11";
}
