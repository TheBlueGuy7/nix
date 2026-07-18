{ inputs, pkgs-stable, ... }:
{
  imports = [
    ./audio.nix
    ./plasma.nix
    ./network.nix
    ./packages.nix
    ./display.nix
    ./services.nix
    ./graphics.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs-stable; };
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    users."etc" = import ../../home/laptop;
  };
}
