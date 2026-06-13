{ inputs, config, pkgs, pkgs-stable, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ./disko.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "v4l2loopback" "snd-aloop" ];
  boot.extraModulePackages = with config.boot.kernelPackages;
    [ v4l2loopback.out ];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';
  boot.blacklistedKernelModules = [
    "dvb_usb_rtl28xxu"
    "rtl2832"
    "rtl2830"
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" "exfat" ];

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
    mesa
    mesa_glu
    vulkan-loader
    mesa-demos
    inputs.agenix.packages.${pkgs.system}.default
    hyprlandPlugins.csgo-vulkan-fix
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

  programs.steam.enable = true;

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
