{ pkgs, unstable, ... }:
{
  home.packages = [
    unstable.chromium
    pkgs.flutter
  ];

  home.sessionVariables = {
    CHROME_EXECUTABLE = "${unstable.chromium}/bin/chromium";
  };
}
