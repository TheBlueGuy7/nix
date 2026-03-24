{ pkgs, ... }:
{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "blueguy" ];

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
