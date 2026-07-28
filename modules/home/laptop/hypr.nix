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

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  home.file.".config/hypr".source = ../../../dotfiles/laptop/hypr;
    home.file.".wallpapers".source = ../../../dotfiles/common/wallpapers;


  programs.rofi.enable = true;
  home.file.".config/rofi".source = ../../../dotfiles/laptop/rofi;

  programs.waybar.enable = true;
  home.file.".config/waybar".source = ../../../dotfiles/laptop/waybar;

  services.mako.enable = true;
  home.file.".config/mako".source = ../../../dotfiles/laptop/mako;
}
