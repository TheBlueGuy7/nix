{pkgs, inputs, ...}:
{

  imports = [
   ./modules/cursor.nix
   ./zsh.nix
  ];

  home = {
    username = "blueguy";
    homeDirectory = "/home/blueguy";
    stateVersion = "25.05";
  };
}
