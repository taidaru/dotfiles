{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.efibootmgr ];

  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        theme = pkgs.catppuccin-grub; # .override { flavor = "mocha"; }
        memtest86.enable = true;
        efiInstallAsRemovable = true;
        splashImage = null;
      };

      efi.canTouchEfiVariables = false;
      timeout = 2;
    };

    plymouth = {
      enable = false;
      theme = "lone";
      themePackages = [
        (pkgs.adi1090x-plymouth-themes.override { selected_themes = [ "lone" ]; })
      ];
    };

    consoleLogLevel = 0;
    initrd.verbose = false;
    initrd.kernelModules = [ "i915" ];
    # initrd.systemd.tpm2.enable = false;
    # initrd.services.lvm.enable = false;
    initrd.compressorArgs = [ "-19" "-T0" ];
    kernelParams = [ "ppp_generic" "ppp_mppe" "quiet" "splash" "udev.log_level=3" "rd.systemd.show_status=false" "systemd.show_status=false" ]; #  "vt.global_cursor_default=0" 
  };

  systemd.settings.Manager.RebootWatchdogSec = "0";

  systemd.services = {
    plymouth-poweroff.enable = false;
    plymouth-reboot.enable = false;
    plymouth-halt.enable = false;
    plymouth-kexec.enable = false;
  };
}
