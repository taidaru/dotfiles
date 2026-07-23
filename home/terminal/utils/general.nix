{ pkgs, unstable, ... }:
{
  home.packages =
    with pkgs;
    [
      fastfetch

      bat
      ripgrep
      nixfmt
      bottom
      ffmpeg
      zip
      unzip
      curl
      wget
      fzf
      git-graph
      mediainfo
      brightnessctl
      ffmpegthumbnailer
      showmethekey
      silicon
      proxychains
      
      alsa-utils
      alsa-tools

      freerdp
      
      lavat
      genact

      # wtype
      # bemoji
      # playerctl
      # w3m

    ]
    ++ (with unstable; [

    ]);
}
