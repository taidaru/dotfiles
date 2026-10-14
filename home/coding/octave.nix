{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (octaveFull.override { graphicsmagick = graphicsmagick_q16; })
    ghostscript
    # matlab-language-server
  ];
}
