{
  zet = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "libvirtd"
      "kvm"
      "wireshark"
      "docker"
    ];
    shell = "zsh";
    autologin = true;
  };
}
