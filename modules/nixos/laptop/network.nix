{ ... }:
{
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;
  nftables.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [  ];
  };
  networking.nameservers = [ "10.10.0.3" "192.168.0.5" ];
  networking.networkmanager.insertNameservers = [ "10.10.0.3" "192.168.0.5" ];
}
