{ pkgs, ... }:
{
  programs.zsh.enable = true;

  users = {
    users.blueguy = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" "dialout" "docker" "input" "plugdev" "wireshark" ];
      initialPassword = "1234";
      shell = pkgs.zsh;
    };
    users.steve = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" "dialout" "docker" ];
      initialPassword = "1234";
      shell = pkgs.zsh;
    };
  };
}
