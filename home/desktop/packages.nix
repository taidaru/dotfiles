{
  pkgs,
  unstable,
  inputs,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      eog
      # mpv
      vlc
      featherpad
      libreoffice
      fuzzel
      grimblast
      wl-clipboard
      cliphist

      # libnotify
    ]
    ++ (with unstable; [
      kdePackages.qt5compat
      qt5.qtgraphicaleffects
    ]);
}
