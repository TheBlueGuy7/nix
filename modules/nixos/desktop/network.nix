{ ... }:
{
  networking.hostName = "radiator";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = false;
    allowedTCPPorts = [ 80 443 ];
  };
  networking.nameservers = [ "192.168.0.11" ];
  networking.networkmanager.insertNameservers = [ "192.168.0.11" ];
}
