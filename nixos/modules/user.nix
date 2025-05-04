{ pkgs, ... }:
{
  
  programs.zsh.enable = true;

  users = {

    defaultUserShell = pkgs.zsh;

    users.hunor = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
    };
  };
}
