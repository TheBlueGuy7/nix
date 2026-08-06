{ ... }:
{
  networking = {
    hostName = "radiator";
    networkmanager.enable = true;
    nftables.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 53317 8080 ];
    };
    nameservers = [ "192.168.0.5" ];
    networkmanager.insertNameservers = [ "192.168.0.5" ];
    defaultGateway = "192.168.0.1";
    useDHCP = false;
    interfaces.enp3s0.ipv4.addresses = [{
      address = "192.168.0.20";
      prefixLength = 24;
    }];
    

    wg-quick.interfaces = {
      wg0 = {
        configFile = "/etc/wireguard/wg0.conf";
        autostart = false;
      };
    };
  };
}
