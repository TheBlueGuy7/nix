{ disks ? [ "/dev/nvme0n1" ], ... }: {
  disko.devices = {
    disk = {
      my-disk = {
        device = builtins.head disks;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };

            # p2: Swap (Fixed 32G)
            swap = {
              size = "32G";
              content = {
                type = "swap";
                resumeDevice = true; # Keeps your hibernation settings
              };
            };

            # p3: Root (Fills the rest)
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
