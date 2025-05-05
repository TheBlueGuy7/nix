{pkgs, ...}:
{

  imports = [
   ./modules/cursor.nix
   ./zsh.nix
  ];

  home = {
    username = "hunor";
    homeDirectory = "/home/hunor";
    stateVersion = "24.11";
  };
}
