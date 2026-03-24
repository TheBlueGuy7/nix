{
  imports = [
    ./zsh.nix
    ./neovim.nix
    ./alacritty.nix
    ./cursor.nix
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  services.playerctld.enable = true;
}
