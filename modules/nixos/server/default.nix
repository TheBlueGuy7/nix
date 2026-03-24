{ inputs, pkgs-stable, ... }:
{
  imports = [
    ./network.nix
    ./services.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs-stable; };
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    users."blueguy" = import ../../home/base;
  };
}
