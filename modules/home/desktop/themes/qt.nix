{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "adwaita-dark";
    style = {
      name = "adwaita-dark";
    };
  };
}
