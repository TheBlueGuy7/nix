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

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome_6
    powerline-fonts
    powerline-symbols
    fira
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
  ];

  time.timeZone = "Europe/Budapest";
  console.keyMap = "us";
  system.stateVersion = "25.11";

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-kde pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  programs.nix-ld.enable = true;
}
