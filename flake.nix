{
  description = "Multi-machine NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    polymc.url = "github:PolyMC/PolyMC";

    prismlauncher = {
      url = "github:PrismLauncher/PrismLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yt-x = {
      url = "github:Benexl/yt-x";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    unsloth-llama-src = {
      url = "github:unslothai/llama.cpp"; 
      flake = false;
    };

  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    polymc,
    rose-pine-hyprcursor,
    hyprland,
    noctalia,
    stylix,
    unsloth-llama-src,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };

    mkHost = { modules }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs pkgs-stable; };
      modules = [
        ./modules/nixos/core
        inputs.home-manager.nixosModules.default
        # inputs.disko.nixosModules.default
        inputs.agenix.nixosModules.default
        inputs.stylix.nixosModules.stylix
	({ pkgs, ... }: {
          nixpkgs.config.allowUnfree = true;

          nixpkgs.overlays = [
            (final: prev: {              
              llama-cpp = (prev.llama-cpp.override { 
                cudaSupport = true; 
              }).overrideAttrs (oldAttrs: {
                pname = "llama-cpp-unsloth";
                version = "10225";
                src = unsloth-llama-src;
                patches = [];
		npmDepsHash = "sha256-pjdbI6NcZRlJVd62xhgbLhWrwFYwgsIwjORqvo1+VD8=";
              });

            })
          ];
        })
      ] ++ modules;
    };

  in {
    nixosConfigurations = {

      "desktop" = mkHost {
        modules = [
          ./hosts/desktop
          ./modules/nixos/desktop
        ];
      };

      "laptop" = mkHost {
        modules = [
          ./hosts/laptop
          ./modules/nixos/laptop
        ];
      };

      "server" = mkHost {
        modules = [
          ./hosts/server
          ./modules/nixos/server
        ];
      };

    };
  };
}
