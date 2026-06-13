{ ... }:
{
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  # wayland.windowManager.hyprland = {
  #  enable = true;
  # package = null;
  # portalPackage = null;
  #  configType = "lua";
  #  systemd.enable = false;
  #};

  # programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  home.file.".config/hypr".source = ../../../dotfiles/hypr;
    home.file.".wallpapers".source = ../../../dotfiles/wallpapers;


  # programs.rofi.enable = true;
  # home.file.".config/rofi".source = ../../../dotfiles/hypr/rofi;

  # programs.waybar.enable = true;
  # home.file.".config/waybar".source = ../../../dotfiles/hypr/waybar;

  # services.dunst.enable = true;
  # home.file.".config/dunst".source = ../../../dotfiles/hypr/dunst;
}
