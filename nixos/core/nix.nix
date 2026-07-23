{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # ponytail: единая точка nixpkgs.config — HM с useGlobalPkgs берёт pkgs отсюда
  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
    permittedInsecurePackages = [ "electron-39.8.10" ];
  };
}
