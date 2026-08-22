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
      # protonup-qt
      # lutris
      winetricks
      wine
      mangohud
      # (wineWowPackages.waylandFull.override {
      #   wineBuild = "wineWow";
      # })
    ]
    ++ (with unstable; [
      lutris
    ]);
}
