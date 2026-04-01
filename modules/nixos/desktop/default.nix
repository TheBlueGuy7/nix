{ inputs, pkgs-stable, ... }:
{
  imports = [
    ./audio.nix
    ./display.nix
    ./graphics.nix
    ./helium.nix
    ./network.nix
    ./packages.nix
    ./services.nix
    ./virtualisation.nix
    ../satisfactory.nix
  ];

  programs.helium.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs-stable; };
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    users."blueguy" = import ../../home/desktop;
  };
}
