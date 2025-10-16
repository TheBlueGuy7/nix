{ pkgs, ... }:
{
  
  programs.zsh.enable = true;

  users = {

    defaultUserShell = pkgs.zsh;

    users.blueguy = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
    };
  };
}
