{ lib, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  services.upower.enable = true;

  specialisation.tty.configuration = {
    programs.hyprland.enable = lib.mkForce false;
    environment.pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];
  };

  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="36a7", ATTRS{idProduct}=="a880", MODE="0660", GROUP="users", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="36a7", ATTRS{idProduct}=="a880", MODE="0660", GROUP="users", TAG+="uaccess"
  '';
  # security.pam.services.hyprlock = { };

  security.polkit.enable = true;
}
