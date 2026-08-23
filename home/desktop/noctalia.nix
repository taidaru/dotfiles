{
  pkgs,
  unstable,
  ...
}:
let
  noctalia = unstable.noctalia;
in
{
  home.packages = [ noctalia ] ++ (with pkgs; [
    matugen 
    cava 
    brightnessctl 
  ]);

  systemd.user.services.noctalia = {
    Unit = {
      Description = "Noctalia Shell";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${noctalia}/bin/noctalia";
      Restart = "on-failure";
      RestartSec = 3;
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
