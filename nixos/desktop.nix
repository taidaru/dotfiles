{
  imports = [
    ./desktop
    ./hardware/audio.nix
    ./hardware/bluetooth.nix
    ./hardware/udisks.nix
  ];

  hardware.graphics.enable32Bit = true;
}
