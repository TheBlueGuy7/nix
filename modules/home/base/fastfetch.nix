{ ... }:
{
  programs.fastfetch.enable = true;
  home.file.".config/fastfetch".source = ../../../dotfiles/common/fastfetch;
}
