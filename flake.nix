{
  description = "Multi-machine NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprlang = {
      url = "github:hyprwm/hyprlang";
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
      inputs.hyprlang.follows = "hyprlang";
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
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    hyprpaper,
    polymc,
    hyprlang,
    rose-pine-hyprcursor,
    hyprland,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };

    # Build a NixOS system. Always includes core + home-manager + agenix.
    mkHost = { modules }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs pkgs-stable; };
      modules = [
        ./modules/nixos/core
        inputs.home-manager.nixosModules.default
        inputs.disko.nixosModules.default
        inputs.agenix.nixosModules.default
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
