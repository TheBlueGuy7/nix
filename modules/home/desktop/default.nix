{ inputs, pkgs, ... }:
{
  imports = [
    ../base
    ./themes
    ./hypr.nix
    ./noctalia/noctalia.nix
    # ./vnc.nix
  ];

  home.sessionVariables = {
    GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules";
  };
  home.username = "blueguy";

}
