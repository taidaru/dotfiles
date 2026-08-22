{ ... }:
{
  imports = [
    ../../home/terminal
    ../../home/desktop
    ../../home/coding
    ../../home/wine
    ../../home/thunar.nix
    ../../home/discord.nix
    ../../home/firefox.nix
    ./home-packages.nix
    ./git.nix
  ];

  home = {
    username = "zet";
    homeDirectory = "/home/zet";
    stateVersion = "25.11";
    file.".hushlogin".text = "";
  };
}
