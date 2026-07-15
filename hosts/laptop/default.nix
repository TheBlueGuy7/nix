{ inputs, config, pkgs, pkgs-stable, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gnome-keyring
    gh
    git
    inputs.agenix.packages.${pkgs.system}.default
  ];

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    adwaita-fonts
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome_6
    fira
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.adwaita-mono
  ];

  time.timeZone = "Europe/Budapest";
  console.keyMap = "us";
  system.stateVersion = "26.05";

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat
    config.boot.kernelPackages.nvidia_x11
  ];
}
