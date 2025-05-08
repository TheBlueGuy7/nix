{ inputs, config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/bundle.nix
    ];
  
  nixpkgs.overlays = [ inputs.polymc.overlay ];

  networking.hostName = "radiator-nixos";

  time.timeZone = "Europe/Budapest";

  console = {
  #   font = "Lat2-Terminus16";
    keyMap = "hu";
  };
  system.stateVersion = "24.11";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.flatpak.enable = true;
  services.dbus.enable = true;
  virtualisation.virtualbox.host.enable = true;


  xdg.portal = {
    enable = true;
    #extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
    wlr.enable = true;
  };
}

