{ lib, pkgs, config, inputs, ... }:
{
  imports = [ inputs.silentSDDM.nixosModules.default ];

  programs.silentSDDM = {
    enable = true;
    theme = "catppuccin-mocha";
  };

  environment.systemPackages = [ pkgs.vanilla-dmz ];
  services.displayManager.sddm.settings.Theme = {
    CursorTheme = "DMZ-Black";
    CursorSize = 24;
  };
}
