{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.xray
  ];

  systemd.services.my_xray = {
    description = "Xray Service with Local Config";

    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    unitConfig = {
      ConditionPathExists = "/persist/vpn/config.json";
    };

    serviceConfig = {
      Type = "simple";

      ExecStart = "${pkgs.xray}/bin/xray run -c /persist/vpn/config.json";

      Restart = "on-failure";
      RestartSec = "5s";

      CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
      AmbientCapabilities = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
    };
  };
}
