{ pkgs, ... }:
{
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    geary
    gnome-music
    gnome-tour
    totem
  ];
}
