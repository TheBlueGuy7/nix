{ pkgs, ... }:
{
    stylix.targets = {
        ghostty.enable = false;
        qt.enable = true;
        gtk.enable = true;
	neovim.enable = false;
	btop.enable = true;
	obsidian.enable = true;
	bat.enable = true;
	zed.enable = true;
    };
    stylix.polarity = "dark";
    stylix.fonts = {
    serif = {
      package = pkgs.adwaita-fonts;
      name = "Adwaita Serif";
    };

    sansSerif = {
      package = pkgs.adwaita-fonts;
      name = "Adwaita Sans";
    };

    monospace = {
      package = pkgs.adwaita-fonts;
      name = "Adwaita Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };
}
