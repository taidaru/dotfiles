{ pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    gparted
    android-tools
    ventoy
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
