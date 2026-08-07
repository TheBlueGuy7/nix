{ inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];
  programs.noctalia = {
    enable = true;
  };

  home.file.".config/noctalia/config.toml".source = ../../../dotfiles/desktop/noctalia/config.toml;
}
