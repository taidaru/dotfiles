{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.ark

    thunar
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
  ];
}
