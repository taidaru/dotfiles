{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gparted
    android-tools
  ];
}
