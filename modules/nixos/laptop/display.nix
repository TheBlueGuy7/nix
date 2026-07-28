{ pkgs, inputs, ... }:
{
  services.xserver.enable = true;
  services.dbus.enable = true;

  services.xserver.xkb.layout = "us";

  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = [ pkgs.sddm-astronaut ];
    settings.General.CursorTheme = "BreezeX-RosePine-Linux";
    settings.General.CursorSize = 24;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # SDDM theme
    sddm-astronaut
    # Hyprland & Wayland
    cliphist
    grim
    grimblast
    hyprcursor
    hypridle
    hyprpicker
    hyprshot
    hyprsunset
    kdePackages.polkit-kde-agent-1
    pyprland
    slurp
    wf-recorder
    wl-clip-persist
    wl-clipboard
    awww
    brightnessctl
    mako
    # Themes & icons
    arc-icon-theme
    colloid-icon-theme
    numix-icon-theme-circle
    papirus-folders
    papirus-icon-theme
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    # inputs.noctalia.packages.${pkgs.system}.default
  ];

}
