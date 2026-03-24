{ ... }:
{
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  home.file.".config/hypr".source = ../../../dotfiles/hypr/hypr;

  programs.rofi.enable = true;
  home.file.".config/rofi".source = ../../../dotfiles/hypr/rofi;

  programs.waybar.enable = true;
  home.file.".config/waybar".source = ../../../dotfiles/hypr/waybar;

  services.dunst.enable = true;
  home.file.".config/dunst".source = ../../../dotfiles/hypr/dunst;
}
