{ lib, hostUsers, ... }:
{
  home-manager.users = lib.genAttrs hostUsers (_: {
    wayland.windowManager.hyprland.settings.monitor = [
      "eDP-1, disabled" # 1920x1080@60, 0x0, 1
      "HDMI-A-2,2560x1440@144,auto,1"
    ];
  });
}
