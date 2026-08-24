{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.sing-box
  ];

  systemd.services.sing-box-custom = {
    description = "Sing-Box Custom Service with Local Config";

    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    unitConfig = {
      ConditionPathExists = "/persist/sing-box/config.json";
    };

    serviceConfig = {
      Type = "simple";

      ExecStart = "${pkgs.sing-box}/bin/sing-box run -c /persist/sing-box/config.json";

      Restart = "on-failure";
      RestartSec = "5s";

      CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
      AmbientCapabilities = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
    };
  };
}
