{ homeStateVersion, ... }:
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
  ];

  home = {
    username = "zet";
    homeDirectory = "/home/zet";
    stateVersion = homeStateVersion;
  };

  programs.git.settings.user = {
    name = "taidaru";
    email = "166142818+taidaru@users.noreply.github.com";
  };
}
