{ inputs, config, pkgs, pkgs-stable, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    inputs.polymc.overlay
    (final: prev: {
      glxinfo = prev.mesa-demos;
    })
    (final: prev: {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
        (python-final: python-prev: {
          picosvg = python-prev.picosvg.overridePythonAttrs (oldAttrs: {
            doCheck = false;
          });
        })
      ];
    })
  ];

  environment.systemPackages = with pkgs-stable; [
    gnome-keyring
    gh
    git
    linuxKernel.packages.linux_6_12.v4l2loopback
    mesa
    mesa_glu
    vulkan-loader
    mesa-demos
    inputs.agenix.packages.${pkgs.system}.default
    hyprlandPlugins.csgo-vulkan-fix
    uv
  ];

  fonts.fontDir.enable = true;
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

  programs.steam.enable = true;

  time.timeZone = "Europe/Budapest";
  console.keyMap = "us";
  system.stateVersion = "25.11";

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-gnome ];
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
