{
  imports = [
    ./zsh.nix
    ./neovim.nix
    ./cursor.nix
    ./ghostty.nix
    ./fastfetch.nix
  ];

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
  services.playerctld.enable = true;
}
