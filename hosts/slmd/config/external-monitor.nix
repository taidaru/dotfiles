{ lib, config, ... }:

with lib;

let
  externalMonitor = config.my.externalMonitor;

  intelPath = "pci-0000:00:02.0";
  nvidiaPath = "pci-0000:01:00.0";

  intelCard = "/dev/dri/gpu-intel";
  nvidiaCard = "/dev/dri/gpu-nvidia";
in

{
  options.my.externalMonitor = mkOption {
    type = types.bool;
    default = false;
    description = "true = external monitor is connected";
  };

  config = mkMerge [
    {
      services.udev.extraRules = ''
        SUBSYSTEM=="drm", KERNEL=="card*", ENV{ID_PATH}=="${intelPath}", SYMLINK+="dri/gpu-intel"
        SUBSYSTEM=="drm", KERNEL=="card*", ENV{ID_PATH}=="${nvidiaPath}", SYMLINK+="dri/gpu-nvidia"
      '';
    }

    (mkIf externalMonitor {
      hardware.nvidia.prime = {
        sync.enable = true;
        offload.enable = false;
      };

      environment.variables = {
        AQ_DRM_DEVICES = "${intelCard}:${nvidiaCard}";
      };
    })

    (mkIf (!externalMonitor) {
      hardware.nvidia.prime = {
        sync.enable = false;
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    })
  ];
}