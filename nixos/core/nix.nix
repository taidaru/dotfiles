{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
    permittedInsecurePackages = [ "electron-39.8.10" ];
  };
}
