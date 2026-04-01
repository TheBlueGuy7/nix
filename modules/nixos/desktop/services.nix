{ pkgs, pkgs-stable, ... }:
{
  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.tailscale.enable = true;
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs-stable.mullvad-vpn;
  services.samba.enable = false;
  services.udev.packages = with pkgs; [ platformio-core.udev ];
  programs.gamescope.enable = true;
  programs.xfconf.enable = true;

  environment.systemPackages = with pkgs; [
    claude-code
  ];
}
