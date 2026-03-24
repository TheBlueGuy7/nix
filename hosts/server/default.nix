{ inputs, config, pkgs, pkgs-stable, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    inputs.agenix.packages.${pkgs.system}.default
  ];

  time.timeZone = "Europe/Budapest";
  console.keyMap = "us";
  system.stateVersion = "25.11";

  programs.nix-ld.enable = true;
}
