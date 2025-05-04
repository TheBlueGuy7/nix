{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/hunor/.wallpapers/wallpaper2.jpg"
      ];
      wallpaper = [
        "HDMI-A-1, /home/hunor/.wallpapers/wallpaper2.jpg"
      ];
    };
  };
}
