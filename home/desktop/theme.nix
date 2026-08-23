{ config, lib, pkgs, inputs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];

  home.packages = with pkgs; [
    papirus-icon-theme
    lxappearance
    qt6Packages.qt6ct
    glib 
    gsettings-desktop-schemas
  ];

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    font = {
      name = "Inter";
      size = 11;
    };
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;

      extraCss = ''
        @import url("noctalia.css");
      '';
    };
    gtk4 = {
      theme = null;
      extraConfig.gtk-application-prefer-dark-theme = true;
      extraCss = ''
        @import url("noctalia.css");
      '';
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.sessionVariables.QT_QPA_PLATFORMTHEME = lib.mkForce "qt6ct";

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    custom_palette=true
    color_scheme_path=${config.xdg.configHome}/qt6ct/colors/noctalia.conf
    standard_dialogs=default
    style=Fusion
  '';

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/hardhacker.yaml";

    autoEnable = false;

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
