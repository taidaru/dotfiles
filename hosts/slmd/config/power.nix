{ lib, config, ... }:

with lib;

let
  powerSave = config.my.powerSave;
  intelPath = "pci-0000:00:02.0";
  nvidiaPath = "pci-0000:01:00.0";
  intelCard = "/dev/dri/gpu-intel";
  nvidiaCard = "/dev/dri/gpu-nvidia";
in
{
  options.my.powerSave = mkOption {
    type = types.bool;
    default = true;
    description = "true = power save, false = max performance; reboot required";
  };

  config = mkMerge [

    {
      services.udev.extraRules = ''
        SUBSYSTEM=="drm", KERNEL=="card*", ENV{ID_PATH}=="${intelPath}", SYMLINK+="dri/gpu-intel"
        SUBSYSTEM=="drm", KERNEL=="card*", ENV{ID_PATH}=="${nvidiaPath}", SYMLINK+="dri/gpu-nvidia"
      '';
    }

    (mkIf powerSave {
      powerManagement.enable = true;
      powerManagement.cpuFreqGovernor = "powersave";
      # powerManagement.scsiLinkPolicy = "min_power";

      services.tlp.enable = true;

      hardware.nvidia = {
        dynamicBoost.enable = false;
        powerManagement.enable = true;

        prime = {
          sync.enable = false;
          offload.enable = true;
        };
      };

      environment.variables = {
        LIBVA_DRIVER_NAME = "intel";
        __GLX_VENDOR_LIBRARY_NAME = "mesa";
        AQ_DRM_DEVICES = "${intelCard}:${nvidiaCard}";
      };
    })

    (mkIf (!powerSave) {
      powerManagement.enable = false;
      # powerManagement.cpuFreqGovernor = "performance";
      # powerManagement.scsiLinkPolicy = "max_performance";

      services.tlp.enable = false;

      hardware.nvidia = {
        # dynamicBoost.enable = true;
        powerManagement.enable = false;

        prime = {
          sync.enable = true;
          offload.enable = false;
        };
      };
      
      environment.variables = {
        LIBVA_DRIVER_NAME = "nvidia";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        AQ_DRM_DEVICES = "${nvidiaCard}:${intelCard}";
      };
    })
  ];
}
