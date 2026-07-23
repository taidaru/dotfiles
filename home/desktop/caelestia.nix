{
  nixpkgs,
  pkgs,
  inputs,
  ...
}:
let
  caelestiaShell = inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.caelestia-shell;
  caelestiaSLI = inputs.caelestia-cli.packages."${pkgs.stdenv.hostPlatform.system}".default;
in
{
  home.packages = with pkgs; [
    caelestiaShell
    caelestiaSLI
  ];

  systemd.user.services.caelestia-shell = {
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };

    Unit = {
      Description = "Caelestia Shell";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${caelestiaShell}/bin/caelestia-shell";
      Restart = "always";
      RestartSec = 5;
    };
  };
}
