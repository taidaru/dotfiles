{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    xdg-utils
    pipewire
  ];

  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-wlr
    ];
    };


    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    cacheHome = "${config.home.homeDirectory}/.cache";
    stateHome = "${config.home.homeDirectory}/.local/state";


    userDirs = {
      enable = true;
      createDirectories = false;
      setSessionVariables = false;
      extraConfig = {
        DOWNLOAD = "${config.home.homeDirectory}/Downloads";
        DOCUMENTS = "${config.home.homeDirectory}/Documents";
        PICTURES = "${config.home.homeDirectory}/Pictures";
        SCREENSHOTS = "${config.home.homeDirectory}/Pictures/Screenshots";
        VIDEOS = "${config.home.homeDirectory}/Videos";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XDG_CURRENT_DESKTOP = "Hyprland";
      };
    };

    mimeApps = {
      enable = true;

      defaultApplications = {
        "image/png" = "eog.desktop";
        "image/jpeg" = "eog.desktop";
        "image/jpg" = "eog.desktop";
        "image/gif" = "eog.desktop";
        "image/svg+xml" = "eog.desktop";
        "image/webp" = "eog.desktop";
        "image/bmp" = "eog.desktop";

        "video/mp4" = "mpv.desktop";
        "video/webm" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
        "video/quicktime" = "mpv.desktop";
        "video/x-msvideo" = "mpv.desktop";
        "video/mpeg" = "mpv.desktop";

        "inode/directory" = "thunar.desktop";

        "application/pdf" = "draw.desktop";
        "application/msword" = "libreoffice-writer.desktop";
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" =
          "libreoffice-writer.desktop";
        "application/vnd.ms-excel" = "libreoffice-calc.desktop";
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop";
        "application/vnd.ms-powerpoint" = "libreoffice-impress.desktop";
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" =
          "libreoffice-impress.desktop";
        "application/vnd.oasis.opendocument.text" = "libreoffice-writer.desktop";
        "application/vnd.oasis.opendocument.spreadsheet" = "libreoffice-calc.desktop";
        "application/vnd.oasis.opendocument.presentation" = "libreoffice-impress.desktop";

        "text/plain" = "featherpad.desktop";
        "application/octet-stream" = "featherpad.desktop";

        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/ftp" = "firefox.desktop";
        "text/html" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
      };
    };

    desktopEntries = {
      VesktopFIX = {
        name = "Vesktop";
        genericName = "VoIP social platform";
        exec = "${pkgs.vesktop}/bin/vesktop --ozone-platform=wayland --enable-features=WaylandWindowDecorations --proxy-server=socks5://127.0.0.1:20217";
        icon = "vesktop";
        type = "Application";
        categories = [
          "Network"
          "InstantMessaging"
        ];
      };
    };
  };
}
