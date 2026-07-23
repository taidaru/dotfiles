{ pkgs, inputs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];

  home.packages = with pkgs; [
    papirus-icon-theme
    orchis-theme
    lxappearance
    qt6Packages.qt6ct
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/hardhacker.yaml";

    autoEnable = false;
    targets = {
      qt.enable = true;
      neovim.enable = true;
      alacritty.enable = true;
      gtk.enable = true;
      hyprland.enable = true;
      bat.enable = true;
    };

    cursor = {
      name = "DMZ-Black";
      size = 24;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };

      monospace = {
        name = "Fira Code";
        package = pkgs.fira-code;
      };

      sansSerif = {
        name = "Inter";
        package = pkgs.inter;
      };

      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sizes = {
        terminal = 13;
        applications = 11;
        desktop = 10;
        popups = 10;
      };
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
  };
}
