{
  isNormalUser = true;
  extraGroups = [
    "wheel"
    "networkmanager"
    "audio"
    "kvm"
    "wireshark"
    "docker"
  ];
  shell = "zsh";
}
