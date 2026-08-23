{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Apps
      "$mainMod,       Q, exec, $terminal"
      "$mainMod,       R, exec, noctalia msg panel-toggle launcher"
      "$mainMod,       A, exec, noctalia msg panel-toggle control-center"
      "$mainMod,       Escape, exec, noctalia msg session"
      "$mainMod,       D, exec, pkill -SIGUSR1 wayscriber"
      "$mainMod,       E, exec, $fileManager"
      "$mainMod,       V, exec, cliphist list | $menu --dmenu | cliphist decode | wl-copy"
      "$mainMod,       L, exec, loginctl lock-session"
      "$mainMod,       P, exec, hyprpicker -an"
      ", Print, exec, grimblast --notify --freeze copysave area"

      # Window control
      "$mainMod,       C, killactive,"
      "$mainMod,       F, togglefloating,"
      "$mainMod,       T, pin,"
      # Scratchpad
      "$mainMod,       S, togglespecialworkspace,  magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # Moving focus
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Moving windows
      "$mainMod SHIFT, left,  swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up,    swapwindow, u"
      "$mainMod SHIFT, down,  swapwindow, d"

      # Resize windows
      "$mainMod CTRL, left,  resizeactive, -60 0"
      "$mainMod CTRL, right, resizeactive,  60 0"
      "$mainMod CTRL, up,    resizeactive,  0 -60"
      "$mainMod CTRL, down,  resizeactive,  0  60"

      # Workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move windows to workspaces
      "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
    ];

    bindm = [
      # Move/resize with mouse
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      # Volume keys
      ",XF86AudioRaiseVolume,  exec, noctalia msg volume-up"
      ",XF86AudioLowerVolume,  exec, noctalia msg volume-down"
      ",XF86AudioMute,         exec, noctalia msg volume-mute"
      ",XF86AudioMicMute,      exec, noctalia msg mic-mute"
      # Brightness keys
      "$mainMod, bracketright, exec, noctalia msg brightness-up"
      "$mainMod, bracketleft,  exec, noctalia msg brightness-down"
    ];

    bindl = [
      # Media keys
      ", XF86AudioNext,  exec, noctalia msg media next"
      ", XF86AudioPause, exec, noctalia msg media play-pause"
      ", XF86AudioPlay,  exec, noctalia msg media play-pause"
      ", XF86AudioPrev,  exec, noctalia msg media previous"
    ];
  };
}
