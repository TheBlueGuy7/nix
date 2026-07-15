{ pkgs, ... }:
{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "blueguy" ];

  environment.systemPackages = with pkgs; [
    virt-manager
  ];


  virtualisation.docker.enable = true;

  users.users."blueguy".extraGroups = [ "docker" ];
}
