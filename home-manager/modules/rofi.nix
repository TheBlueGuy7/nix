{pkgs, ...}:
{
  home.packages = [ pkgs.rofi ];

  programs.rofi = {
    enable = true;
    theme = {
      "*" = {
        background = "#1E2127FF";
        "background-alt" = "#282B31FF"; 
        foreground = "#FFFFFFFF";
        selected = "#61AFEFFF";
        active = "#98C379FF";
        urgent = "#E06C75FF";

        "text-selected" = "@background";
        text = "@foreground";

        "shade-shadow" = "white / 6%";
        "shade-bg" = "white / 12%";
        "shade-border" = "white / 24%";
      };

      configuration = {
        modi = "drun";
        "show-icons" = true;
        "display-calc" = " ";
        "display-drun" = " ";
        "drun-display-format" = "{name}";
        font = "JetBrains Mono NF 12";
      };

      window = {
        fullscreen = false;
        transparency = "real";
        cursor = "default";
        "background-color" = "black / 12%";
        border = 0;
        "border-color" = "#61AFEFFF";
        width = "100%";
        height = "100%";
        margin = 0;
        padding = 0;
      };

      "element normal.normal, element alternate.normal" = {
        "background-color" = "transparent";
        "text-color" = "@text";
      };

      "element selected.normal" = {
        "background-color" = "@shade-bg";
        "text-color" = "white";
        border = "1px solid";
        "border-color" = "#61AFEFFF";
      };

      "element-text" = {
        "background-color" = "transparent";
        "text-color" = "inherit";
        highlight = "inherit";
        cursor = "inherit";
        "vertical-align" = "center";
        "horizontal-align" = "center";
      };

      element = {
        cursor = "pointer";
        "border-radius" = 24;
        "background-color" = "transparent";
        "text-color" = "@text";
        orientation = "vertical";
        spacing = 16;
        margin = 0;
        padding = "36px 0px";
      };

      "element-icon" = {
        "background-color" = "transparent";
        "text-color" = "inherit";
        size = 72;
        cursor = "inherit";
      };

      listview = {
        border = 0;
      };

      scrollbar = {
        margin = "0px 4px";
        "handle-width" = 8;
        "handle-color" = "white";
        "background-color" = "@shade-shadow";
        "border-radius" = 4;
      };

      message = {
        "background-color" = "@shade-bg";
        border = "1px solid";
        "border-color" = "transparent";
        "border-radius" = 12;
        padding = 24;
      };

      "error-message" = {
        padding = 100;
        border = "0px solid";
        "border-radius" = 0;
        "background-color" = "black / 10%";
        "text-color" = "@text";
      };

      textbox = {
        "background-color" = "transparent";
        "text-color" = "@text";
        "vertical-align" = "center";
        "horizontal-align" = "center";
        highlight = "none";
      };

      mainbox = {
        children = [ "inputbar" "message" "listview" "mode-switcher" ];
        "background-color" = "transparent";
        spacing = 24;
        margin = 0;
        padding = "100px 226px";
      };

      inputbar = {
        children = [ "prompt" "entry" ];
        "border-radius" = 12;
        "background-color" = "@shade-bg";
        "text-color" = "@text";
        spacing = 12;
        margin = "0% 28%";
        padding = 14;
      };

      prompt = {
        "background-color" = "transparent";
        "text-color" = "inherit";
      };

      "textbox-prompt-colon" = {
        expand = false;
        str = "::";
        "background-color" = "transparent";
        "text-color" = "inherit";
      };

      entry = {
        "background-color" = "transparent";
        "text-color" = "inherit";
        cursor = "inherit";
        placeholder = " ";
        "placeholder-color" = "inherit";
      };

      listview = {
        cursor = "default";
        columns = 6;
        lines = 4;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = "vertical";
        reverse = false;
        "fixed-height" = true;
        "fixed-columns" = true;
        "background-color" = "transparent";
        "text-color" = "@text";
        spacing = 0;
        margin = 0;
        padding = 0;
      };

      "mode-switcher" = {
        "background-color" = "transparent";
        border = 0;
        margin = 0;
        padding = 0;
        spacing = 12;
      };

      button = {
        padding = "12px 0px";
        "border-radius" = 12;
        "background-color" = "@shade-shadow";
        "text-color" = "@text";
        cursor = "pointer";
      };

      "button selected" = {
        "background-color" = "@shade-bg";
        border = "1px solid";
        "border-color" = "transparent";
        "text-color" = "white";
      };
    };
  };
}