{ pkgs, ... }:
{
  imports = [
    ../base
    ./themes
    ./hypr.nix
    ./vnc.nix
  ];

  home.sessionVariables = {
    GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules";
  };
}
