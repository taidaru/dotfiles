{ lib, config, ... }:

with lib;

let
  powerSave = config.my.powerSave;
in

{
  options.my.powerSave = mkOption {
    type = types.bool;
    default = true;
    description = "true = power save";
  };

  config = mkMerge [
    (mkIf powerSave {
      powerManagement.enable = true;
      powerManagement.cpuFreqGovernor = "powersave";

      services.tlp.enable = true;

      hardware.nvidia = {
        dynamicBoost.enable = false;
        powerManagement.enable = true;
      };

      environment.variables = {
        LIBVA_DRIVER_NAME = "intel";
        __GLX_VENDOR_LIBRARY_NAME = "mesa";
      };
    })

    (mkIf (!powerSave) {
      powerManagement.enable = false;
      services.tlp.enable = false;

      hardware.nvidia = {
        powerManagement.enable = false;
      };

      environment.variables = {
        LIBVA_DRIVER_NAME = "nvidia";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      };
    })
  ];
}
