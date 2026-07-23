{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dejavu_fonts
    font-awesome
    hackgen-nf-font
    ibm-plex
    jetbrains-mono
    material-icons
    maple-mono.NF
    minecraftia
    nerd-fonts.im-writing
    nerd-fonts.blex-mono
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-monochrome-emoji
    powerline-fonts
    roboto
    roboto-mono
    symbola
    terminus_font
    victor-mono

    fira-code
    fira-code-symbols
    
    inter
    noto-fonts
    noto-fonts-color-emoji

    noto-fonts-lgc-plus
    texlivePackages.hebrew-fonts
    powerline-symbols
  ];

  fonts.fontconfig.enable = true;
}
