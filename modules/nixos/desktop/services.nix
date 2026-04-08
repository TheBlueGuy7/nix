{ pkgs, pkgs-stable, ... }:
{
  services.flatpak.enable = true;

  # Expose system fonts and nix store to Flatpak apps (fonts are symlinks into /nix/store)
  system.activationScripts.flatpak-fonts = ''
    mkdir -p /var/lib/flatpak/overrides
    cat > /var/lib/flatpak/overrides/global << 'EOF'
[Context]
filesystems=/run/current-system/sw/share/X11/fonts:ro;/nix/store:ro;xdg-config/fontconfig:ro
EOF
  '';
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
