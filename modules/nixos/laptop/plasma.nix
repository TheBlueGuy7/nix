{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.theme = "sddm-astronaut-theme";
  services.displayManager.sddm.extraPackages = [ pkgs.sddm-astronaut ];
  services.desktopManager.plasma6.enable = true;
  services.dbus.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
  services.tailscale.enable = true;
}
