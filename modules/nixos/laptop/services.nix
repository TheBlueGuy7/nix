{ pkgs, pkgs-stable, ... }:
{
  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.samba.enable = false;
  services.udev.packages = with pkgs; [ platformio-core.udev ];
  programs.gamescope.enable = true;
  programs.xfconf.enable = true;
}
