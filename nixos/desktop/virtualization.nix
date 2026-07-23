{
  # boot.kernelModules = [ "kvm-intel" ];
  # programs.virt-manager.enable = true;

  # services.spice-vdagentd.enable = true;

  virtualisation = {
    # spiceUSBRedirection.enable = true;
    docker.enable = true;

    # libvirtd = {
    #   enable = true;
    #   qemu.swtpm.enable = true;
    # };
  };
}
