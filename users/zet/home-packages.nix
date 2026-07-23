{
  pkgs,
  unstable,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      obsidian
      obs-studio
      pavucontrol
      ayugram-desktop
      steam
      gimp
      bitwarden-desktop
      transmission_4-gtk
      qalculate-qt
      sqlitestudio
    ]
    ++ (with unstable; [
      # eww
    ]);
}
