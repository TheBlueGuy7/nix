{ ... }:
{
  programs.neovim.enable = true;
  home.file.".config/neovim".source = ../../../dotfiles/neovim;
}
