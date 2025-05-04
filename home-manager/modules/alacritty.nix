{
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        size = 11.0;
        normal = {
          family = "Jetbrains Mono";
          style = "Regular";
        };
      };

      window = {
        opacity = 0.6;
        padding = {
          x = 15;
          y = 15;
        };
      };

      selection.save_to_clipboard = true;
    };
  };
}

