{ ... }:
{
  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
    nftables.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [  ];
    };
    nameservers = [ "10.10.0.3" ];
    networkmanager.insertNameservers = [ "10.10.0.3" ];

    wg-quick.interfaces = {
      wg0 = {
        configFile = "/etc/wireguard/wg0.conf";
        autostart = true;
      };
    };
  };
}
