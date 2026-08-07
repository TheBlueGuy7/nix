# Noctalia v5 theme configuration.
# Uses lib.mkForce so these values win over the upstream module defaults
# (e.g. the automatic Stylix integration) and the mkDefault base values.

{ pkgs, lib, ... }:

{
  programs.noctalia = {
    settings = {
      # ─── Theme & Color Scheme ─────────────────────────────────────────
      theme = {
        mode = lib.mkForce "dark";
        source = lib.mkForce "custom";
        custom_palette = lib.mkForce "Steel"; # overrides the module's "stylix" default
        pure_black_dark = lib.mkForce false;

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

      # ─── Location (Night Light / theme scheduling) ────────────────────
      location = {
        custom_schedule = lib.mkForce true;
        sunrise = lib.mkForce "06:30";
        sunset = lib.mkForce "18:30";
      };

      # ─── UI & Shell Appearance ────────────────────────────────────────
      shell = {
        font_family = lib.mkForce "Adwaita Sans";
        card_borders = lib.mkForce false;
        popup_borders = lib.mkForce false;

        panel = {
          borders = lib.mkForce false;
          transparency_mode = lib.mkForce "solid";
          control_center_placement = lib.mkForce "attached";
          session_placement = lib.mkForce "attached";
          wallpaper_placement = lib.mkForce "attached";
          list_item_background = lib.mkForce false;
        };
      };

      accessibility = {
        ui_scale = lib.mkForce 1.0;
      };
    };

    # ─── Custom Palette ("Steel") ─────────────────────────────────────────
    # Proper v5 schema: nested under "dark" (used for both modes when "light"
    # is omitted), keys keep their v4 "m" prefixes. The module writes this to
    # ~/.config/noctalia/palettes/Steel.json for you.
    customPalettes = {
      Steel = {
        dark = {
          mPrimary = "#3d6aa8";
          mOnPrimary = "#0e1014";
          mSecondary = "#4d7eb8";
          mOnSecondary = "#0e1014";
          mTertiary = "#2d5a8c";
          mOnTertiary = "#0e1014";
          mError = "#b85a5a";
          mOnError = "#0e1014";
          mSurface = "#0f1115";
          mOnSurface = "#b8bcc2";
          mSurfaceVariant = "#16191e";
          mOnSurfaceVariant = "#6e7279";
          mOutline = "#262a30";
          mShadow = "#05060a";
          mHover = "#1c1f24";
          mOnHover = "#d4d7dc";
        };
      };
    };
  };
}
