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
    setupScript = "${pkgs.writeShellScript "sddm-setup" ''
      ${pkgs.xorg.xrandr}/bin/xrandr \
        --output DVI-D-1 --mode 1920x1080 --pos 0x0 \
        --output HDMI-A-1 --mode 1920x1080 --pos 1920x0 --primary
    ''}";
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
    swww
    wf-recorder
    wl-clip-persist
    wl-clipboard

    # Themes & icons
    arc-icon-theme
    colloid-icon-theme
    numix-icon-theme-circle
    papirus-folders
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];
}
