{ pkgs, inputs, ... }: {
  home.pointerCursor = {
    enable = true;
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 24;
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = true;
    };
  };
}
