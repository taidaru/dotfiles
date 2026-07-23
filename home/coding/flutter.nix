{ pkgs, unstable, ... }:
let
  android = pkgs.androidenv.composeAndroidPackages {
    platformVersions = [ "36" ];
    buildToolsVersions = [ "35.0.0" ];
    abiVersions = [ "arm64-v8a" ];
    includeEmulator = false;
    includeNDK = true;
    cmakeVersions = [ "3.22.1" ];
  };
in
{
  home.packages = [
    android.androidsdk
    unstable.chromium
    pkgs.flutter
  ];

  home.sessionVariables = {
    ANDROID_SDK_ACCEPT_LICENSES = "1";
    ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
    CHROME_EXECUTABLE = "${unstable.chromium}/bin/chromium";
  };

  home.sessionPath = [
    "${android.androidsdk}/platform-tools"
    "${android.androidsdk}/emulator"
    "${android.androidsdk}/cmdline-tools/latest/bin"
  ];
}
