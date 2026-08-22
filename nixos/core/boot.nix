{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        memtest86.enable = true;
        configurationLimit = 10;
      };

      efi.canTouchEfiVariables = true;
      timeout = 2;
    };

    plymouth = {
      enable = true;
      theme = "lone";
      themePackages = [
        ((pkgs.adi1090x-plymouth-themes.override { selected_themes = [ "lone" ]; }).overrideAttrs (o: {
          postFixup = (o.postFixup or "") + ''
            sed -i '1i Window.SetBackgroundTopColor(0,0,0); Window.SetBackgroundBottomColor(0,0,0);' \
              $out/share/plymouth/themes/lone/lone.script
          '';
        }))
      ];
    };

    consoleLogLevel = 0;
    initrd.verbose = false;
    initrd.kernelModules = [ "i915" ];
    initrd.systemd.tpm2.enable = false;
    initrd.services.lvm.enable = false;
    initrd.compressorArgs = [ "-19" "-T0" ];
    kernelParams = [ "quiet" "splash" "udev.log_level=3" "rd.systemd.show_status=false" "systemd.show_status=false" "vt.global_cursor_default=0" ];
  };

  systemd.settings.Manager.RebootWatchdogSec = "0";

  systemd.services = {
    plymouth-poweroff.enable = false;
    plymouth-reboot.enable = false;
    plymouth-halt.enable = false;
    plymouth-kexec.enable = false;
  };
}
