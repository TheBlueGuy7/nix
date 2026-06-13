{ pkgs, ... }:
{
  qt = {
    enable = true;
    # platformTheme.name = "adwaita-dark";
    #style = {
    #  name = "adwaita-dark";
    # };
  };

  home.sessionVariables = {
    # Forces Quickshell (Noctalia) to use your Papirus theme
    QS_ICON_THEME = "Papirus-Dark";

  };
}
