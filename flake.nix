{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpaper = {
       url = "github:hyprwm/hyprpaper";
       inputs.nixpkgs.follows = "nixpkgs";
   };

    polymc.url = "github:PolyMC/PolyMC";

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/hyprland?ref=v0.36.0";

  };


  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... } @inputs:
  
  let
    system = "x86_64-linux";
  in {

      nixosConfigurations.radiator-nixos = nixpkgs.lib.nixosSystem {

	  specialArgs = {
            pkgs-stable = import nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
	    inherit system inputs;
	  };

	  modules = [

	    ./nixos/configuration.nix
	    inputs.nixvim.nixosModules.nixvim

          ];
      };

      homeConfigurations.hunor = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home-manager/home.nix ];
      };
  };
}
