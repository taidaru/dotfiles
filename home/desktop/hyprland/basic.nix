{
  services.hyprpolkitagent.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";

    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      "$fileManager" = "thunar";
      "$menu" = "fuzzel";

      # monitors in hosts/<name>/config/monitors.nix

      exec-once = [
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      # cursor = {
      #   no_hardware_cursors = true;
      # };

      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 0;
        resize_on_border = false;
        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = false;
        };
        blur = {
          enabled = true;
        };
      };

      gestures = {
        workspace_swipe_invert = false;
        workspace_swipe_forever = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
  };
}
