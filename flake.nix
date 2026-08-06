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
      url = "github:noctalia-dev/noctalia";
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

    unsloth-tarball-src = {
      url = "https://github.com/unslothai/llama.cpp/releases/download/b10225-mix-345e1e3/llama.cpp-source-commit-d2a74a4a3cd1bbc60127bebc6f8334e987d6d005.tar.gz";
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
    unsloth-tarball-src,
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
	({ pkgs, inputs, ... }: {
          nixpkgs.overlays = [
            (final: prev: {
              llama-cpp = (prev.llama-cpp.override {
                cudaSupport = true;
                cudaPackages = final.cudaPackages; # Uses your system's CUDA
              }).overrideAttrs (oldAttrs: {
                pname = "llama-cpp-unsloth";
                version = "10225";
                
                # Use the official Unsloth release tarball
                src = inputs.unsloth-tarball-src;
                
                # Keep NixOS patches so the binary installs correctly
                patches = oldAttrs.patches or [];

		npmDepsHash = "sha256-B7uEynAG70a3xauBKc20RuFa9cnWaWzVBCh+LPLBnIM=";
                
                cmakeFlags = (oldAttrs.cmakeFlags or []) ++ [
                  (prev.lib.cmakeBool "GGML_NATIVE" false)
                  (prev.lib.cmakeBool "GGML_CPU_ALL_VARIANTS" false)
                  
                  # GTX 1650 is Turing architecture (Compute Capability 7.5)
                  # This tells the compiler to ONLY build for your specific GPU.
                  (prev.lib.cmakeFeature "CMAKE_CUDA_ARCHITECTURES" "75")
                ];

                env = (oldAttrs.env or {}) // {
                  # i5-10400F is Comet Lake, which uses Skylake lineage instructions
                  NIX_CFLAGS_COMPILE = toString ((oldAttrs.env.NIX_CFLAGS_COMPILE or "") + " -march=skylake -mtune=skylake");
                };

                preConfigure = (oldAttrs.preConfigure or "") + ''
                  export NIX_ENFORCE_NO_NATIVE=0
                '';
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
