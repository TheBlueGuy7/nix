{ pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./noctalia-theme.nix
    #./noctalia-plugins.nix
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      # ─── Shell (General & App Launcher) ─────────────────────────────────
      shell = {
        corner_radius_scale = lib.mkDefault 1.0;
        font_family = lib.mkDefault "sans-serif";
        time_format = lib.mkDefault "{:%H:%M}";
        date_format = lib.mkDefault "%A, %x";
        offline_mode = lib.mkDefault false;
        telemetry_enabled = lib.mkDefault false;
        avatar_path = lib.mkDefault "/home/blueguy/Pictures/pfp/v2-6pheq-107od.jpg";
        clipboard_enabled = lib.mkDefault true;
        clipboard_keep_from_closed_apps = lib.mkDefault true;
        clipboard_auto_paste = lib.mkDefault "auto";
        
        animation = {
          enabled = lib.mkDefault true;
          speed = lib.mkDefault 1.0;
        };

        shadow = {
          direction = lib.mkDefault "down_right";
          alpha = lib.mkDefault 0.55;
        };

        panel = {
          transparency_mode = lib.mkDefault "solid";
          borders = lib.mkDefault true;
          shadow = lib.mkDefault true;
          launcher_placement = lib.mkDefault "floating";
          control_center_placement = lib.mkDefault "attached";
        };

        launcher = {
          categories = lib.mkDefault true;
          show_icons = lib.mkDefault true;
          compact = lib.mkDefault false;
          sort_by_usage = lib.mkDefault true;
          provider_prefix = lib.mkDefault "/";
          auto_paste = lib.mkDefault "auto";
        };

        mpris = {
          blacklist = lib.mkDefault [];
        };
      };

      # ─── Theme Defaults (Overridden by noctalia-theme.nix) ─────────────
      theme = {
        mode = lib.mkDefault "dark";
        source = lib.mkDefault "builtin";
        builtin = lib.mkDefault "Noctalia";
        pure_black_dark = lib.mkDefault false;
      };

      # ─── Wallpaper ──────────────────────────────────────────────────────
      wallpaper = {
        enabled = lib.mkDefault true;
        fill_mode = lib.mkDefault "crop";
        fill_color = lib.mkDefault "#000000";
        transition = lib.mkDefault [ "fade" "disc" "stripes" "wipe" "pixelate" "honeycomb" ];
        transition_duration = lib.mkDefault 1500;
        edge_smoothness = lib.mkDefault 0.05;
        directory = lib.mkDefault "/home/blueguy/.wallpapers";
        
        automation = {
          enabled = lib.mkDefault false;
          interval_seconds = lib.mkDefault 300;
          order = lib.mkDefault "random";
          recursive = lib.mkDefault true;
        };
      };

      # ─── Notifications & OSD ────────────────────────────────────────────
      notification = {
        enable_daemon = lib.mkDefault true;
        show_app_name = lib.mkDefault true;
        show_actions = lib.mkDefault true;
        layer = lib.mkDefault "top";
        scale = lib.mkDefault 1.0;
        background_opacity = lib.mkDefault 1.0;
        offset_x = lib.mkDefault 20;
        offset_y = lib.mkDefault 8;
      };

      osd = {
        position = lib.mkDefault "top_right";
        scale = lib.mkDefault 1.0;
        background_opacity = lib.mkDefault 1.0;
        offset_x = lib.mkDefault 20;
        offset_y = lib.mkDefault 8;
        
        kinds = {
          volume = lib.mkDefault true;
          brightness = lib.mkDefault true;
          wifi = lib.mkDefault true;
          bluetooth = lib.mkDefault true;
          power_profile = lib.mkDefault true;
          lock_keys = lib.mkDefault true;
        };
      };

      # ─── Lock Screen & System Monitor ───────────────────────────────────
      lockscreen = {
        enabled = lib.mkDefault true;
        blurred_desktop = lib.mkDefault true;
        blur_intensity = lib.mkDefault 0.5;
        tint_intensity = lib.mkDefault 0.3;
      };

      system = {
        monitor = {
          enabled = lib.mkDefault true;
          cpu_poll_seconds = lib.mkDefault 2.0;
          gpu_poll_seconds = lib.mkDefault 5.0;
          memory_poll_seconds = lib.mkDefault 2.0;
          network_poll_seconds = lib.mkDefault 3.0;
          disk_poll_seconds = lib.mkDefault 10.0;
        };
      };

      calendar = { enabled = lib.mkDefault true; };
      
      control_center = {
        calendar = {
          show_events_card = lib.mkDefault true;
          show_week_numbers = lib.mkDefault false;
        };
      };

      weather = {
        enabled = lib.mkDefault true;
        unit = lib.mkDefault "celsius";
        effects = lib.mkDefault true;
      };

      audio = {
        enable_overdrive = lib.mkDefault false;
        enable_sounds = lib.mkDefault false;
        sound_volume = lib.mkDefault 0.5;
      };

      brightness = {
        enable_ddcutil = lib.mkDefault false;
      };

      # Note: nightlight and location are handled in noctalia-theme.nix

      idle = {
        behavior = {
          lock = {
            timeout = lib.mkDefault 600;
            action = lib.mkDefault "lock";
            enabled = lib.mkDefault true;
          };
          screen-off = {
            timeout = lib.mkDefault 300;
            action = lib.mkDefault "screen_off";
            enabled = lib.mkDefault true;
          };
        };
      };

      # ─── Bar & Widgets ──────────────────────────────────────────────────
      bar = {
        order = lib.mkDefault [ "default" ];
        
        default = {
          position = lib.mkDefault "top";
          enabled = lib.mkDefault true;
          thickness = lib.mkDefault 34;
          background_opacity = lib.mkDefault 0.93;
          radius = lib.mkDefault 12;
          margin_ends = lib.mkDefault 4;
          margin_edge = lib.mkDefault 4;
          padding = lib.mkDefault 14;
          widget_spacing = lib.mkDefault 6;
          scale = lib.mkDefault 1.0;
          shadow = lib.mkDefault true;
          auto_hide = lib.mkDefault false;
          reserve_space = lib.mkDefault true;
          
          start = lib.mkDefault [ "clock" "system-monitor" "media" "active-window" ];
          center = lib.mkDefault [ "workspaces" ];
          end = lib.mkDefault [ "tray" "tailscale" "notifications" "volume" "control-center" "session" ];
        };
      };

      widget = {
        clock = {
          type = lib.mkDefault "clock";
          format = lib.mkDefault "{:%H:%M}";
          tooltip_format = lib.mkDefault "{:%H:%M %a, %b %d}";
          font_weight = lib.mkDefault 700;
        };
        workspaces = { type = lib.mkDefault "workspaces"; };
        system-monitor = { type = lib.mkDefault "system_monitor"; };
        media = { type = lib.mkDefault "media"; };
        active-window = { type = lib.mkDefault "active_window"; };
        tray = { type = lib.mkDefault "tray"; };
        notifications = { type = lib.mkDefault "notifications"; };
        volume = { type = lib.mkDefault "volume"; };
        control-center = { type = lib.mkDefault "control_center"; };
        session = { type = lib.mkDefault "session"; };
        tailscale = { type = lib.mkDefault "plugin:tailscale"; };
      };

      dock = {
        enabled = lib.mkDefault false;
        position = lib.mkDefault "bottom";
        icon_size = lib.mkDefault 48;
        background_opacity = lib.mkDefault 1.0;
        radius = lib.mkDefault 16;
        margin_edge = lib.mkDefault 8;
        shadow = lib.mkDefault true;
        show_running = lib.mkDefault true;
        auto_hide = lib.mkDefault true;
        magnification = lib.mkDefault true;
      };

      desktop_widgets = {
        enabled = lib.mkDefault true;
      };

      keybinds = {
        validate = lib.mkDefault [ "return" "kp_enter" "space" ];
        cancel = lib.mkDefault [ "escape" ];
        left = lib.mkDefault [ "left" ];
        right = lib.mkDefault [ "right" ];
        up = lib.mkDefault [ "up" ];
        down = lib.mkDefault [ "down" ];
        delete = lib.mkDefault [ "del" ];
      };
    };
  };
}
