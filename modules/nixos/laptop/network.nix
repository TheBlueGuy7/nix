{ ... }:
{
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };
  networking.nameservers = [ "192.168.0.11" ];
  networking.networkmanager.insertNameservers = [ "192.168.0.11" ];
}
