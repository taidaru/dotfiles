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
      bottles
      # protonup-qt
      # lutris
      winetricks
      wine
      # (wineWowPackages.waylandFull.override {
      #   wineBuild = "wineWow";
      # })
    ]
    ++ (with unstable; [
      lutris
    ]);
}
