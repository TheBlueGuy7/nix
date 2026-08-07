# Noctalia settings, converted from a GUI-exported config.toml
# (dotfiles/desktop/noctalia/config.toml) into declarative Nix.
#
# This is a 1:1 transcription of the exported TOML, reorganized with
# section comments. It's meant to fully replace both noctalia.nix and
# noctalia-theme.nix as the single source of truth.
#
# IMPORTANT: once this is imported, Home Manager writes
# ~/.config/noctalia/config.toml as a symlink into the Nix store on every
# rebuild. The file becomes read-only from the noctalia GUI's perspective —
# settings changed in the app will NOT persist across your next
# `home-manager switch`.

{ inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;

    settings = {

      # ───────────────────────── Accessibility ──────────────────────────
      accessibility = {
        high_contrast = false;
        ui_scale = 0.95;
      };

      # ──────────────────────────── Audio ────────────────────────────────
      audio = {
        enable_overdrive = true;
        enable_sounds = true;
        notification_sound = "";
        sound_volume = 0.5;
        volume_change_sound = "";
      };

      # ─────────────────────────── Backdrop ──────────────────────────────
      # Blur/tint behind floating panels.
      backdrop = {
        blur_intensity = 0.5;
        enabled = false;
        tint_intensity = 0.3;
      };

      # ───────────────────────────── Bar ─────────────────────────────────
      bar = {
        order = [ "default" ];

        default = {
          auto_hide = false;
          background_opacity = 0.9;
          border = "outline";
          border_width = 0.0;
          capsule = false;
          capsule_fill = "surface_variant";
          capsule_opacity = 1.0;
          capsule_padding = 6.0;
          capsule_thickness = 0.76;
          center = [ "workspaces" ];
          concave_edge_corners = true;
          contact_shadow = false;
          enabled = true;
          # "screenshot" removed from the end group.
          end = [ "group:g2" "volume" "session" "tray" ];
          font_weight = 500;
          hover_highlight = true;
          layer = "top";
          margin_edge = 4;
          margin_ends = 4;
          margin_opposite_edge = 0;
          padding = 14;
          panel_overlap = 1;
          position = "top";
          radius = 12;
          radius_bottom_left = 12;
          radius_bottom_right = 12;
          radius_top_left = 12;
          radius_top_right = 12;
          reserve_space = true;
          scale = 0.9;
          shadow = true;
          show_on_workspace_switch = true;
          smart_auto_hide = false;
          start = [ "clock" "group:g1" "media" "audio_visualizer" ];
          thickness = 28;
          widget_spacing = 6;

          dead_zone = { };

          # Grouped widgets rendered as a single capsule.
          capsule_group = [
            {
              # g1: CPU / GPU / RAM cluster (start of bar).
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g1";
              members = [ "cpu" "sysmon" "ram" ];
              opacity = 1.0;
              padding = 6.0;
            }
            {
              # g2: network stats cluster (end of bar).
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g2";
              members = [ "network" "network_rx" "network_tx" ];
              opacity = 1.0;
              padding = 6.0;
            }
          ];
        };
      };

      # ─────────────────────────── Battery ───────────────────────────────
      battery = {
        warning_threshold = 10;
      };

      # ────────────────────────── Brightness ─────────────────────────────
      brightness = {
        enable_ddcutil = false;
        ignore_mmids = [ ];
        minimum_brightness = 0.0;
        sync_all_monitors = false;
      };

      # ─────────────────────────── Calendar ──────────────────────────────
      calendar = {
        enabled = true;
        refresh_minutes = 15;
      };

      # ───────────────────────── Control Center ──────────────────────────
      control_center = {
        hidden_tabs = [ ];
        show_shortcut_labels = true;
        sidebar = "compact";
        sidebar_section = "compact";
        width = 700;

        calendar = {
          event_date_format = "%A %e %B";
          event_time_format = "%H:%M";
          show_events_card = false;
          show_week_numbers = false;
        };

        # Quick-toggle shortcuts shown in the control center.
        shortcuts = [
          { type = "wifi"; }
          { type = "caffeine"; }
          { type = "nightlight"; }
          { type = "notification"; }
        ];
      };

      # ────────────────────────── Desktop Widgets ────────────────────────
      # Freely-placed widgets on the desktop itself (clock + media player).
      desktop_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [
          "desktop-widget-0000000000000001"
          "desktop-widget-0000000000000002"
        ];

        grid = {
          cell_size = 8;
          major_interval = 4;
          visible = true;
        };

        widget = {
          # Digital clock, top-right area of the HDMI output.
          "desktop-widget-0000000000000001" = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 1821.3;
            cy = 540.0;
            enabled = true;
            output = "HDMI-A-1";
            rotation = 0.0;
            type = "clock";
            settings = {
              clock_style = "digital";
              color = "on_surface";
              font_family = "";
            };
          };
          # Media player widget, lower-left area.
          "desktop-widget-0000000000000002" = {
            box_height = 112.0;
            box_width = 256.0;
            cx = 136.0;
            cy = 1020.0;
            enabled = true;
            output = "HDMI-A-1";
            rotation = 0.0;
            type = "media_player";
            settings = {
              background = true;
              hide_when_no_media = true;
            };
          };
        };
      };

      # ──────────────────────────── Dock ─────────────────────────────────
      # Disabled (enabled = false) — settings kept so it's ready if turned on.
      dock = {
        active_monitor_only = false;
        active_opacity = 1.0;
        active_scale = 1.0;
        auto_hide = true;
        background_opacity = 1.0;
        border = "outline";
        border_width = 0.0;
        concave_edge_corners = true;
        cross_axis_padding = 8;
        enabled = false;
        icon_size = 27;
        inactive_opacity = 0.85;
        inactive_scale = 0.85;
        item_spacing = 6;
        launcher_custom_image = "";
        launcher_custom_image_colorize = false;
        launcher_icon = "grid-dots";
        launcher_position = "none";
        layer = "top";
        magnification = true;
        magnification_scale = 1.45;
        main_axis_padding = 16;
        margin_edge = 8;
        margin_ends = 0;
        monitors = [ ];
        pinned = [ ];
        position = "bottom";
        radius = 16;
        radius_bottom_left = 16;
        radius_bottom_right = 16;
        radius_top_left = 16;
        radius_top_right = 16;
        reserve_space = false;
        shadow = true;
        show_dots = false;
        show_instance_count = true;
        show_running = true;
        smart_auto_hide = false;
      };

      # ──────────────────────────── Hooks ────────────────────────────────
      # Shell commands to run on system events. All unset for now.
      hooks = {
        battery_charging = [ ];
        battery_discharging = [ ];
        battery_percentage_changed = [ ];
        battery_plugged = [ ];
        bluetooth_disabled = [ ];
        bluetooth_enabled = [ ];
        colors_changed = [ ];
        logging_out = [ ];
        power_profile_changed = [ ];
        rebooting = [ ];
        session_locked = [ ];
        session_unlocked = [ ];
        shutting_down = [ ];
        started = [ ];
        theme_mode_changed = [ ];
        wallpaper_changed = [ ];
        wifi_disabled = [ ];
        wifi_enabled = [ ];
      };

      # ─────────────────────────── Hot Corners ───────────────────────────
      hot_corners = {
        delay_ms = 0;
        enabled = false;

        bottom_left = { action = "none"; command = ""; };
        bottom_right = { action = "none"; command = ""; };
        top_left = { action = "none"; command = ""; };
        top_right = { action = "none"; command = ""; };
      };

      # ───────────────────────────── Idle ────────────────────────────────
      idle = {
        behavior_order = [ "lock" "screen-off" ];
        pre_action_fade_seconds = 2.0;

        behavior = {
          lock = {
            action = "lock";
            command = "";
            enabled = true;
            resume_command = "";
            timeout = 600.0; # 10 minutes
          };
          "screen-off" = {
            action = "screen_off";
            command = "";
            enabled = true;
            resume_command = "";
            timeout = 300.0; # 5 minutes
          };
        };
      };

      # ─────────────────────────── Keybinds ──────────────────────────────
      # Navigation keys used within noctalia's own UI (launcher, dialogs).
      keybinds = {
        cancel = [ "Escape" ];
        copy = [ "Ctrl+c" ];
        delete = [ "Delete" ];
        down = [ "Down" ];
        left = [ "Left" ];
        right = [ "Right" ];
        save = [ "Ctrl+s" ];
        tab_next = [ "Tab" ];
        tab_previous = [ "Shift+ISO_Left_Tab" ];
        up = [ "Up" ];
        validate = [ "Return" "KP_Enter" "space" ];
      };

      # ─────────────────────────── Location ──────────────────────────────
      # Used for night light / theme scheduling.
      location = {
        address = "Érd, Hungary";
        auto_locate = false;
        custom_schedule = true;
        sunrise = "06:30";
        sunset = "18:30";
      };

      # ────────────────────────── Lock Screen ────────────────────────────
      lockscreen = {
        allow_empty_password = false;
        blur_intensity = 0.5;
        blurred_desktop = false;
        enabled = true;
        fingerprint = true;
        lock_before_suspend = true;
        monitors = [ ];
        tint_intensity = 0.3;
        wallpaper = "";
      };

      # ───────────────────── Lock Screen Widgets ─────────────────────────
      # Login box placed identically on both outputs.
      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box@HDMI-A-1"
          "lockscreen-login-box@DVI-D-1"
        ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget = {
          "lockscreen-login-box@DVI-D-1" = {
            box_height = 196.0;
            box_width = 810.0;
            cx = 960.0;
            cy = 898.0;
            enabled = true;
            output = "DVI-D-1";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              center_password_text = false;
              input_opacity = 1.0;
              input_radius = 6.0;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_session_buttons = true;
              show_unlock_hint = true;
              show_weather = true;
            };
          };
          "lockscreen-login-box@HDMI-A-1" = {
            box_height = 196.0;
            box_width = 810.0;
            cx = 960.0;
            cy = 898.0;
            enabled = true;
            output = "HDMI-A-1";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              center_password_text = false;
              input_opacity = 1.0;
              input_radius = 6.0;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_session_buttons = true;
              show_unlock_hint = true;
              show_weather = true;
            };
          };
        };
      };

      # ────────────────────────── Night Light ────────────────────────────
      nightlight = {
        enabled = false;
        force = false;
        temperature_day = 6500;
        temperature_night = 4000;
      };

      # ───────────────────────── Notifications ───────────────────────────
      notification = {
        background_opacity = 1.0;
        border = true;
        collapse_on_dismiss = true;
        enable_daemon = true;
        history_retention_hours = 0;
        layer = "top";
        max_visible = 0;
        monitors = [ ];
        offset_x = 20;
        offset_y = 8;
        position = "top_right";
        scale = 1.0;
        show_actions = true;
        show_app_name = true;
      };

      # ────────────────────────────── OSD ────────────────────────────────
      # On-screen display for volume/brightness/etc. pop-ups.
      osd = {
        background_opacity = 1.0;
        border = true;
        enabled = true;
        monitors = [ ];
        offset_x = 20;
        offset_y = 8;
        orientation = "horizontal";
        position = "top_right";
        position_vertical = "top_center";
        scale = 1.0;

        kinds = {
          bluetooth = true;
          brightness = true;
          caffeine = true;
          dnd = true;
          keyboard_backlight = true;
          keyboard_layout = true;
          lock_keys = true;
          media = true;
          nightlight = true;
          power_profile = true;
          privacy = true;
          volume = true;
          volume_input = true;
          volume_output = true;
          wifi = true;
        };
      };

      # ─────────────────────────── Plugins ───────────────────────────────
      plugin_settings = { };

      plugins = {
        auto_update = true;
        enabled = [ ];

        source = [
          {
            enabled = true;
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            name = "official";
          }
          {
            enabled = true;
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
            name = "community";
          }
        ];
      };

      # ──────────────────────────── Shell ────────────────────────────────
      # General shell behaviour: launcher, panels, clipboard, screenshots,
      # session menu, etc.
      shell = {
        app_icon_colorize = false;
        avatar_path = "/home/blueguy/.pfp.png";
        button_borders = true;
        card_borders = false;
        clipboard_auto_paste = "auto";
        clipboard_confirm_clear_history = true;
        clipboard_enabled = true;
        clipboard_history_max_entries = 100;
        clipboard_image_action_command = "";
        clipboard_keep_from_closed_apps = true;
        corner_radius_scale = 1.0;
        date_format = "%A, %x";
        disable_mipmaps = false;
        external_ip_enabled = false;
        font_family = "Adwaita Sans";
        input_borders = true;
        launch_apps_as_systemd_services = false;
        launch_apps_custom_command = "";
        niri_overview_type_to_launch_enabled = false;
        offline_mode = false;
        password_style = "default";
        polkit_agent = true;
        popup_borders = false;
        popup_shadows = true;
        screen_time_enabled = false;
        settings_show_advanced = true;
        settings_window_translucent = false;
        setup_wizard_enabled = false;
        shared_gl_context = true;
        show_location = true;
        telemetry_enabled = false;
        time_format = "{:%H:%M}";

        animation = {
          enabled = true;
          speed = 1.0;
        };

        greeter_sync = {
          auto_sync = false;
        };

        keyboard_layout = { };

        launcher = {
          app_grid = false;
          auto_paste = "auto";
          categories = true;
          compact = true;
          fetch_exchange_rates = true;
          provider_prefix = "/";
          show_icons = true;
          sort_by_usage = true;

          dmenu = { };
        };

        mpris = {
          blacklist = [ ];
        };

        # Placement/style of floating panels (launcher, control center, etc).
        panel = {
          borders = false;
          clipboard_placement = "floating";
          clipboard_position = "center";
          control_center_placement = "floating";
          control_center_position = "auto";
          floating_layer = "overlay";
          floating_offset = 8;
          launcher_placement = "floating";
          launcher_position = "center";
          list_item_background = false;
          open_near_click_clipboard = false;
          open_near_click_control_center = true;
          open_near_click_launcher = false;
          open_near_click_session = false;
          open_near_click_wallpaper = false;
          polkit_placement = "floating";
          polkit_position = "center";
          session_placement = "attached";
          session_position = "auto";
          shadow = true;
          transparency_mode = "solid";
          wallpaper_placement = "attached";
          wallpaper_position = "auto";
        };

        privacy = {
          cam_filter_regex = "";
          mic_filter_regex = "";
          screen_filter_regex = "";
        };

        screen_corners = {
          enabled = false;
          size = 32;
        };

        screenshot = {
          confirm_region = false;
          copy_to_clipboard = true;
          directory = "";
          filename_pattern = "";
          freeze_screen = true;
          pipe_command = "";
          pipe_to_command = false;
          remember_last_region = false;
          save_to_file = true;
          show_cursor = false;
        };

        # Power/session menu (lock, logout, suspend, reboot, shutdown).
        session = {
          grid = false;
          grid_columns = 3;
          show_shortcuts = true;

          power = { };

          actions = [
            { action = "lock"; command = ""; countdown_seconds = 0.0; enabled = true; glyph = ""; label = ""; shortcut = "1"; variant = "default"; }
            { action = "logout"; command = ""; countdown_seconds = 0.0; enabled = true; glyph = ""; label = ""; shortcut = "2"; variant = "default"; }
            { action = "lock_and_suspend"; command = ""; countdown_seconds = 0.0; enabled = true; glyph = ""; label = ""; shortcut = "3"; variant = "default"; }
            { action = "reboot"; command = ""; countdown_seconds = 0.0; enabled = true; glyph = ""; label = ""; shortcut = "4"; variant = "default"; }
            { action = "shutdown"; command = ""; countdown_seconds = 0.0; enabled = true; glyph = ""; label = ""; shortcut = "5"; variant = "destructive"; }
          ];
        };

        shadow = {
          alpha = 0.55;
          direction = "down_right";
        };
      };

      # ─────────────────────────── Storage ───────────────────────────────
      storage = {
        key_file = "";
        key_source = "secret-service";
      };

      # ─────────────────────── System Monitor ────────────────────────────
      # Poll intervals and activity/critical thresholds for CPU/GPU/RAM/
      # disk/network stats (used by the sysmon widgets and OSD warnings).
      system = {
        monitor = {
          cpu_poll_seconds = 2.0;
          cpu_temp_activity_threshold = 60.0;
          cpu_temp_critical_threshold = 85.0;
          cpu_temp_sensor_path = "";
          cpu_usage_activity_threshold = 50.0;
          cpu_usage_critical_threshold = 90.0;
          disk_free_activity_threshold = 80.0;
          disk_free_critical_threshold = 95.0;
          disk_free_pct_activity_threshold = 80.0;
          disk_free_pct_critical_threshold = 95.0;
          disk_poll_seconds = 10.0;
          disk_used_activity_threshold = 80.0;
          disk_used_critical_threshold = 95.0;
          disk_used_pct_activity_threshold = 80.0;
          disk_used_pct_critical_threshold = 95.0;
          enabled = true;
          gpu_poll_seconds = 5.0;
          gpu_temp_activity_threshold = 60.0;
          gpu_temp_critical_threshold = 85.0;
          gpu_usage_activity_threshold = 50.0;
          gpu_usage_critical_threshold = 95.0;
          gpu_vram_activity_threshold = 50.0;
          gpu_vram_critical_threshold = 90.0;
          memory_poll_seconds = 2.0;
          net_rx_activity_threshold = 1.0;
          net_rx_critical_threshold = 50.0;
          net_tx_activity_threshold = 1.0;
          net_tx_critical_threshold = 50.0;
          network_poll_seconds = 3.0;
          ram_pct_activity_threshold = 60.0;
          ram_pct_critical_threshold = 90.0;
          swap_pct_activity_threshold = 20.0;
          swap_pct_critical_threshold = 80.0;
        };
      };

      # ──────────────────────────── Theme ────────────────────────────────
      theme = {
        builtin = "Noctalia";
        community_palette = "Oxocarbon";
        custom_palette = "stylix"; # generated by the Stylix integration
        mode = "dark";
        pure_black_dark = false;
        source = "custom";
        wallpaper_scheme = "m3-content";

        templates = {
          builtin_ids = [ ];
          community_ids = [ ];
          enable_builtin_templates = true;
          enable_community_templates = true;
        };
      };

      # ─────────────────────────── Wallpaper ─────────────────────────────
      wallpaper = {
        directory = "/home/blueguy/.wallpapers";
        directory_dark = "";
        directory_light = "";
        edge_smoothness = 0.05;
        enabled = true;
        fill_color = "surface";
        fill_mode = "crop";
        per_monitor_directories = false;
        transition = [ "fade" "disc" "stripes" "wipe" "honeycomb" ];
        transition_duration = 1500.0;
        transition_on_startup = false;

        automation = {
          enabled = true;
          interval_seconds = 300;
          order = "random";
          recursive = true;
        };
      };

      # ──────────────────────────── Weather ──────────────────────────────
      weather = {
        effects = true;
        enabled = true;
        refresh_minutes = 30;
        unit = "celsius";
      };

      # ──────────────────────────── Widgets ──────────────────────────────
      # Definitions referenced by name from bar.default.start/center/end
      # above. The "tailscale" widget definition has been removed since
      # it isn't placed on the bar and the plugin isn't enabled.
      widget = {
        "active-window" = { type = "active_window"; };
        active_window = {
          icon_size = 14.0;
          max_length = 260.0;
          min_length = 80.0;
          title_scroll = "none";
          type = "active_window";
        };
        clock = {
          font_weight = 700;
          format = "{:%H:%M}";
          tooltip_format = "{:%H:%M %a, %b %d}";
          type = "clock";
        };
        "control-center" = { type = "control_center"; };
        cpu = { stat = "cpu_usage"; type = "sysmon"; };
        date = { format = "{:%a %d %b}"; type = "clock"; };
        input_volume = { device = "input"; type = "volume"; };
        keyboard_layout = { hide_when_single_layout = false; type = "keyboard_layout"; };
        lock_keys = {
          display = "short";
          hide_when_off = false;
          show_caps_lock = true;
          show_num_lock = true;
          show_scroll_lock = false;
          type = "lock_keys";
        };
        media = {
          art_size = 16.0;
          max_length = 120;
          min_length = 80.0;
          title_scroll = "none";
          type = "media";
        };
        network_rx = { stat = "net_rx"; type = "sysmon"; visualization = "none"; };
        network_tx = { stat = "net_tx"; type = "sysmon"; visualization = "none"; };
        notifications = { type = "notifications"; };
        output_volume = { device = "output"; type = "volume"; };
        ram = { stat = "ram_used"; type = "sysmon"; };
        session = { type = "session"; };
        spacer = { interactive = false; type = "spacer"; };
        sysmon = { stat = "gpu_usage"; type = "sysmon"; };
        "system-monitor" = { type = "system_monitor"; };
        temp = { stat = "cpu_temp"; type = "sysmon"; };
        tray = { type = "tray"; };
        volume = { type = "volume"; };
        workspaces = { type = "workspaces"; };
      };
    };
  };
}
