{ inputs, pkgs-stable, ... }:
{
  imports = [
    ./audio.nix
    ./plasma.nix
    ./network.nix
    ./packages.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs-stable; };
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    users."blueguy" = import ../../home/laptop;
  };
}
