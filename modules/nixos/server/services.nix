{ pkgs, ... }:
{
  services.dbus.enable = true;
  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    htop
    wget
    curl
  ];
}
