{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages = with pkgs; [
    # Apps
    brave
    firefox
    vesktop
    vlc
    obs-studio
    kdePackages.kate
    kdePackages.ark
    kdePackages.kdenlive
    kdePackages.kleopatra
    libreoffice-qt6-fresh
    obsidian
    spotify
    mpv
    deluge
    filezilla
    qalculate-gtk
    localsend
    trayscale
    virt-manager
    nodejs_24
    python313
    vscode

    # Themes & icons
    arc-icon-theme
    papirus-folders
    colloid-icon-theme
  ];
}
