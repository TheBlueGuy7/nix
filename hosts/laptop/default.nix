{ inputs, config, pkgs, pkgs-stable, ... }:

{
  imports = [
    ./hardware-configuration.nix
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
  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" "exfat" ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gnome-keyring
    gh
    git
    inputs.agenix.packages.${pkgs.system}.default
    polkit_gnome
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

  security.pam.services.login.fprintAuth = true;
  security.pam.services.sudo.fprintAuth = true;
  security.pam.services.sddm.fprintAuth = true;
  security.polkit.enable = true;
}
