{ pkgs, ... }:
{
  # boot.kernelModules = [ "kvm-intel" ];
  # programs.virt-manager.enable = true;

  # services.spice-vdagentd.enable = true;

  virtualisation = {
    # spiceUSBRedirection.enable = true;
    docker.enable = true;
    docker.enableOnBoot = false;
    # ponytail: без dockerCompat — конфликтует с docker.enable
    podman.enable = true;

    # libvirtd = {
    #   enable = true;
    #   qemu.swtpm.enable = true;
    # };
  };

  environment.systemPackages = [ pkgs.distrobox ];
}
