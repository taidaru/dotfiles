{ inputs, ... }:
{
  imports = [
    ./core
    ./network
    ./hardware/zram.nix
    ./user
    ./packages.nix
  ];
}
