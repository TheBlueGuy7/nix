# Noctalia Theme & Colors Configuration
# Maps to ~/.config/noctalia/colors.json + settings.colorSchemes
#
# All 16 Material 3 colors (including hover-state values) must be set.
# Currently using the "Steel" color scheme from the original config.

{ ... }:

{
  programs.noctalia-shell = {
    # ─── Color Scheme Settings ──────────────────────────────────────────
    settings = {
      colorSchemes = {
        darkMode = true;
        generationMethod = "muted";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        monitorForColors = "";
        predefinedScheme = "Steel";
        schedulingMode = "off";
        syncGsettings = true;
        useWallpaperColors = false;
      };

      # Night light is theming-adjacent
      nightLight = {
        autoSchedule = true;
        dayTemp = "6500";
        enabled = false;
        forced = false;
        manualSunrise = "06:30";
        manualSunset = "18:30";
        nightTemp = "4000";
      };

      # UI fonts and visual style
      ui = {
        boxBorderEnabled = false;
        fontDefault = "Adwaita Sans";
        fontDefaultScale = 1;
        fontFixed = "monospace";
        fontFixedScale = 1;
        panelBackgroundOpacity = 0.93;
        panelsAttachedToBar = true;
        scrollbarAlwaysVisible = true;
        settingsPanelMode = "attached";
        settingsPanelSideBarCardStyle = false;
        tooltipsEnabled = true;
        translucentWidgets = false;
      };

      # Template theming
      templates = {
        activeTemplates = [
          { enabled = true; id = "yazi"; }
          { enabled = true; id = "ghostty"; }
          { enabled = true; id = "btop"; }
          { enabled = true; id = "qt"; }
          { enabled = true; id = "discord"; }
          { enabled = true; id = "hyprland"; }
        ];
        enableUserTheming = false;
      };
    };

    # ─── Theme Colors (Steel) ───────────────────────────────────────────
    # Maps to ~/.config/noctalia/colors.json
    colors = {
      mError = "#b85a5a";
      mHover = "#1c1f24";
      mOnError = "#0e1014";
      mOnHover = "#d4d7dc";
      mOnPrimary = "#0e1014";
      mOnSecondary = "#0e1014";
      mOnSurface = "#b8bcc2";
      mOnSurfaceVariant = "#6e7279";
      mOnTertiary = "#0e1014";
      mOutline = "#262a30";
      mPrimary = "#3d6aa8";
      mSecondary = "#4d7eb8";
      mShadow = "#05060a";
      mSurface = "#0f1115";
      mSurfaceVariant = "#16191e";
      mTertiary = "#2d5a8c";
    };

    # ─── User Templates ─────────────────────────────────────────────────
    # Maps to ~/.config/noctalia/user-templates.toml
    # Currently empty/placeholder — add your custom templates below.
    # Can be a string (TOML), a path to a .toml file, or an attribute set.
    user-templates = {
      config = { };
      templates = { };
    };
  };
}
