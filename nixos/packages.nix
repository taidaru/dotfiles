{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gparted
    sing-box
    android-tools
    # v2raya
  ];
}
