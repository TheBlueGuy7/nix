{ pkgs, ... }:
{
    stylix.targets = {
        ghostty.enable = true;
        noctalia-shell.enable = false;
        qt.enable = true;
        gtk.enable = true;
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
