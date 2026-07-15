{ ... }:
{
  networking = {
    hostName = "radiator";
    networkmanager.enable = true;
    nftables.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 53317 ];
    };
    nameservers = [ "192.168.0.5" ];
    networkmanager.insertNameservers = [ "192.168.0.5" ];

    wg-quick.interfaces = {
      wg0 = {
        configFile = "/etc/wireguard/wg0.conf";
        autostart = false;
      };
    };
  };
}
