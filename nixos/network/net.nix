{
  networking.networkmanager.enable = true;
  # programs.nm-applet.enable = true;

  networking.firewall = {
    enable = false;
    # allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    # allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedTCPPorts = [ 8080 51413 ];
    allowedUDPPorts = [ 8080 51413 ];
  };

  services.create_ap = {
    enable = false;
    settings = {
      INTERNET_IFACE = "enp46s0";
      WIFI_IFACE = "wlp48s0";
      SSID = "slmd";
      PASSPHRASE = "00001222";
    };
  };

}
