# Replace this file with the output of:
#   nixos-generate-config --show-hardware-config
# on the laptop machine.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "uas" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # TODO: replace UUIDs with actual values from the laptop
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9aeacdad-b720-454a-85e6-4ebc02e25dbb";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/9FBC-C010";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/8b6c24bd-c953-45f7-8759-92d53424bbd5"; }
    ];

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
