{ pkgs, lib, ... }:

{
  programs.noctalia = {
    settings = {
      # ─── Theme & Color Scheme ─────────────────────────────────────────
      theme = {
        # We use lib.mkForce here to override the module's automatic Stylix integration.
        # Without mkForce, the module defaults this to "stylix" if Stylix is enabled in your system.
        mode = lib.mkForce "dark";
        source = lib.mkForce "custom";
        custom_palette = lib.mkForce "Steel";
        pure_black_dark = lib.mkForce false;
        
        # Template theming
        templates = {
          enable_builtin_templates = lib.mkForce true;
          enable_community_templates = lib.mkForce true;
          builtin_ids = lib.mkForce [ "yazi" "ghostty" "btop" "qt" "discord" "hyprland" ];
        };
      };

      # ─── Night Light ──────────────────────────────────────────────────
      nightlight = {
        enabled = lib.mkForce false;
        force = lib.mkForce false;
        temperature_day = lib.mkForce 6500;
        temperature_night = lib.mkForce 4000;
      };

      # ─── Location (for Night Light scheduling) ────────────────────────
      location = {
        custom_schedule = lib.mkForce true; 
        sunrise = lib.mkForce "06:30";
        sunset = lib.mkForce "18:30";
      };

      # ─── UI & Shell Appearance ────────────────────────────────────────
      shell = {
        font_family = lib.mkForce "Adwaita Sans";
        
        # Maps to boxBorderEnabled = false
        card_borders = lib.mkForce false;
        popup_borders = lib.mkForce false;
        
        panel = {
          borders = lib.mkForce false;
          # Maps to panelBackgroundOpacity = 0.93 and translucentWidgets = false
          transparency_mode = lib.mkForce "solid"; 
          
          # Maps to panelsAttachedToBar = true and settingsPanelMode = "attached"
          control_center_placement = lib.mkForce "attached";
          session_placement = lib.mkForce "attached";
          wallpaper_placement = lib.mkForce "attached";
          list_item_background = lib.mkForce false;
        };
      };

      accessibility = {
        # Maps to fontDefaultScale = 1
        ui_scale = lib.mkForce 1.0;
      };
    };
  };

  # ─── Custom Palette File ────────────────────────────────────────────────
  # In v5, custom palettes are JSON files in ~/.config/noctalia/palettes/
  # We use xdg.configFile to generate the "Steel.json" palette file.
  # Note: v5 palette JSON keys drop the 'm' prefix (e.g., 'primary' instead of 'mPrimary').
  xdg.configFile."noctalia/palettes/Steel.json".text = builtins.toJSON {
    primary = "#3d6aa8";
    on_primary = "#0e1014";
    secondary = "#4d7eb8";
    on_secondary = "#0e1014";
    tertiary = "#2d5a8c";
    on_tertiary = "#0e1014";
    error = "#b85a5a";
    on_error = "#0e1014";
    surface = "#0f1115";
    on_surface = "#b8bcc2";
    surface_variant = "#16191e";
    on_surface_variant = "#6e7279";
    outline = "#262a30";
    shadow = "#05060a";
    
    # Hover states
    hover = "#1c1f24";
    on_hover = "#d4d7dc";
  };
}
