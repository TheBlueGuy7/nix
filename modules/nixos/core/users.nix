{ pkgs, ... }:
{
  programs.zsh.enable = true;

  users = {
    users.blueguy = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" "dialout" "docker" "input" "plugdev" "wireshark" "kvm" ];
      initialPassword = "1234";
      shell = pkgs.zsh;
    };
  };
}
