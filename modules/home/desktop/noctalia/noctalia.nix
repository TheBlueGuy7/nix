# Noctalia Shell Nix Configuration
# Converted from JSON/TOML config according to https://docs.noctalia.dev/v4/
#
# Usage:
#   1. Add the Noctalia flake input to your flake.nix
#   2. Import this file in your Home Manager config
#   3. Reference this module via `imports = [ ./noctalia.nix ];`
#
# Note: Since ~/.config/noctalia/settings.json becomes a read-only symlink,
# any GUI changes will be lost on rebuild. To capture GUI-modified settings:
#   noctalia-shell ipc call state all | jq .settings
# Then update this file accordingly.

{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./noctalia-theme.nix
    ./noctalia-plugins.nix
  ];

  programs.noctalia-shell = {
    enable = true;

    # ─── Main Settings ────────────────────────────────────────────────────
    # Maps to ~/.config/noctalia/settings.json
    # (Theme/colors and plugins live in separate files)
    settings = {
      settingsVersion = 59;

      # ─── General ──────────────────────────────────────────────────────
      general = {
        allowPanelsOnScreenWithoutBar = true;
        allowPasswordWithFprintd = false;
        animationDisabled = false;
        animationSpeed = 1;
        autoStartAuth = false;
        avatarImage = "/home/blueguy/Pictures/pfp/v2-6pheq-107od.jpg";
        boxRadiusRatio = 1;
        clockFormat = "hh\\nmm";
        clockStyle = "custom";
        compactLockScreen = false;
        dimmerOpacity = 0.2;
        enableBlurBehind = true;
        enableLockScreenCountdown = false;
        enableLockScreenMediaControls = true;
        enableShadows = true;
        forceBlackScreenCorners = false;
        iRadiusRatio = 1;
        keybinds = {
          keyDown = [ "Down" ];
          keyEnter = [ "Return" "Enter" ];
          keyEscape = [ "Esc" ];
          keyLeft = [ "Left" ];
          keyRemove = [ "Del" ];
          keyRight = [ "Right" ];
          keyUp = [ "Up" ];
        };
        language = "";
        lockOnSuspend = true;
        lockScreenAnimations = false;
        lockScreenBlur = 0.5;
        lockScreenCountdownDuration = 10000;
        lockScreenMonitors = [ ];
        lockScreenTint = 0.3;
        passwordChars = false;
        radiusRatio = 1;
        reverseScroll = false;
        scaleRatio = 0.9;
        screenRadiusRatio = 1;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        showChangelogOnStartup = true;
        showHibernateOnLockScreen = false;
        showScreenCorners = false;
        showSessionButtonsOnLockScreen = true;
        smoothScrollEnabled = true;
        telemetryEnabled = false;
      };

      # ─── Bar ──────────────────────────────────────────────────────────
      bar = {
        autoHideDelay = 500;
        autoShowDelay = 150;
        backgroundOpacity = 0.93;
        barType = "floating";
        capsuleColorKey = "none";
        capsuleOpacity = 1;
        contentPadding = 2;
        density = "compact";
        displayMode = "always_visible";
        enableExclusionZoneInset = true;
        fontScale = 1;
        frameRadius = 12;
        frameThickness = 8;
        hideOnOverview = false;
        marginHorizontal = 4;
        marginVertical = 4;
        middleClickAction = "none";
        middleClickCommand = "";
        middleClickFollowMouse = false;
        monitors = [ ];
        mouseWheelAction = "none";
        mouseWheelWrap = true;
        outerCorners = true;
        position = "top";
        reverseScroll = false;
        rightClickAction = "controlCenter";
        rightClickCommand = "";
        rightClickFollowMouse = true;
        screenOverrides = [ ];
        showCapsule = true;
        showOnWorkspaceSwitch = true;
        showOutline = false;
        useSeparateOpacity = false;
        widgetSpacing = 6;

        widgets = {
          center = [
            {
              characterCount = 2;
              colorizeIcons = false;
              emptyColor = "secondary";
              enableScrollWheel = true;
              focusedColor = "primary";
              followFocusedScreen = false;
              fontWeight = "bold";
              groupedBorderOpacity = 1;
              hideUnoccupied = false;
              iconScale = 0.8;
              id = "Workspace";
              labelMode = "index";
              occupiedColor = "secondary";
              pillSize = 0.7;
              showApplications = false;
              showApplicationsHover = false;
              showBadge = true;
              showLabelsOnlyWhenOccupied = true;
              unfocusedIconsOpacity = 1;
            }
          ];

          left = [
            {
              clockColor = "none";
              customFont = "";
              formatHorizontal = "HH:mm";
              formatVertical = "";
              id = "Clock";
              tooltipFormat = "HH:mm ddd, MMM dd";
              useCustomFont = false;
            }
            {
              compactMode = true;
              diskPath = "/";
              iconColor = "none";
              id = "SystemMonitor";
              showCpuCores = false;
              showCpuFreq = false;
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskAvailable = false;
              showDiskUsage = false;
              showDiskUsageAsPercent = false;
              showGpuTemp = false;
              showLoadAverage = false;
              showMemoryAsPercent = false;
              showMemoryUsage = true;
              showNetworkStats = false;
              showSwapUsage = false;
              textColor = "none";
              useMonospaceFont = true;
              usePadding = false;
            }
            {
              compactMode = false;
              hideMode = "hidden";
              hideWhenIdle = false;
              id = "MediaMini";
              maxWidth = 145;
              panelShowAlbumArt = true;
              scrollingMode = "hover";
              showAlbumArt = true;
              showArtistFirst = true;
              showProgressRing = true;
              showVisualizer = false;
              textColor = "none";
              useFixedWidth = false;
              visualizerType = "linear";
            }
            {
              colorizeIcons = false;
              hideMode = "hidden";
              id = "ActiveWindow";
              maxWidth = 145;
              scrollingMode = "hover";
              showIcon = true;
              showText = true;
              textColor = "none";
              useFixedWidth = false;
            }
          ];

          right = [
            {
              blacklist = [ ];
              chevronColor = "none";
              colorizeIcons = false;
              drawerEnabled = true;
              hidePassive = false;
              id = "Tray";
              pinned = [ ];
            }
            {
              defaultSettings = {
                compactMode = false;
                defaultPeerAction = "copy-ip";
                hideDisconnected = false;
                hideMullvadExitNodes = true;
                loginServer = "";
                pingCount = 5;
                refreshInterval = 5000;
                showIpAddress = true;
                showPeerCount = true;
                showSearchBar = false;
                sshUsername = "";
                taildropDownloadDir = "~/Downloads";
                taildropEnabled = true;
                taildropReceiveMode = "operator";
                terminalCommand = "";
              };
              id = "plugin:tailscale";
            }
            {
              hideWhenZero = false;
              hideWhenZeroUnread = false;
              iconColor = "none";
              id = "NotificationHistory";
              showUnreadBadge = true;
              unreadBadgeColor = "primary";
            }
            {
              displayMode = "onhover";
              iconColor = "none";
              id = "Volume";
              middleClickCommand = "pwvucontrol || pavucontrol";
              textColor = "none";
            }
            {
              colorizeDistroLogo = false;
              colorizeSystemIcon = "none";
              colorizeSystemText = "none";
              customIconPath = "";
              enableColorization = false;
              icon = "noctalia";
              id = "ControlCenter";
              useDistroLogo = false;
            }
            {
              iconColor = "error";
              id = "SessionMenu";
            }
          ];
        };
      };

      # ─── Brightness ──────────────────────────────────────────────────
      brightness = {
        backlightDeviceMappings = [ ];
        brightnessStep = 5;
        enableDdcSupport = false;
        enforceMinimum = true;
      };

      # ─── Calendar ────────────────────────────────────────────────────
      calendar = {
        cards = [
          { enabled = true; id = "calendar-header-card"; }
          { enabled = true; id = "calendar-month-card"; }
          { enabled = true; id = "weather-card"; }
        ];
      };

      # ─── Control Center ─────────────────────────────────────────────
      controlCenter = {
        cards = [
          { enabled = true; id = "profile-card"; }
          { enabled = true; id = "shortcuts-card"; }
          { enabled = true; id = "audio-card"; }
          { enabled = false; id = "brightness-card"; }
          { enabled = true; id = "weather-card"; }
          { enabled = true; id = "media-sysmon-card"; }
        ];
        diskPath = "/";
        position = "close_to_bar_button";
        shortcuts = {
          left = [
            { id = "Network"; }
            { id = "Bluetooth"; }
            { id = "WallpaperSelector"; }
            { id = "NoctaliaPerformance"; }
          ];
          right = [
            { id = "Notifications"; }
            { id = "PowerProfile"; }
            { id = "KeepAwake"; }
            { id = "NightLight"; }
          ];
        };
      };

      # ─── Desktop Widgets ────────────────────────────────────────────
      desktopWidgets = {
        enabled = true;
        gridSnap = true;
        gridSnapScale = false;
        monitorWidgets = [
          {
            name = "DVI-D-1";
            widgets = [ ];
          }
          {
            name = "HDMI-A-1";
            widgets = [
              {
                hideMode = "hidden";
                id = "MediaPlayer";
                roundedCorners = true;
                scale = 0.8350268319622323;
                showAlbumArt = true;
                showBackground = true;
                showButtons = true;
                showVisualizer = true;
                visualizerType = "mirrored";
                x = 20;
                y = 1000;
              }
              {
                clockColor = "none";
                clockStyle = "minimal";
                customFont = "Adwaita Sans";
                format = "HH:mm\\nd MMMM yyyy";
                id = "Clock";
                roundedCorners = true;
                scale = 1.6849544515571875;
                showBackground = true;
                useCustomFont = true;
                x = 1720;
                y = 60;
              }
              {
                id = "Weather";
                roundedCorners = true;
                scale = 0.7543172220158616;
                showBackground = true;
                x = 1720;
                y = 180;
              }
            ];
          }
        ];
        overviewEnabled = true;
      };

      # ─── Dock ────────────────────────────────────────────────────────
      dock = {
        animationSpeed = 2;
        backgroundOpacity = 1;
        colorizeIcons = false;
        deadOpacity = 0.6;
        displayMode = "auto_hide";
        dockType = "floating";
        enabled = true;
        floatingRatio = 1;
        groupApps = false;
        groupClickAction = "cycle";
        groupContextMenuMode = "extended";
        groupIndicatorStyle = "dots";
        inactiveIndicators = false;
        indicatorColor = "tertiary";
        indicatorOpacity = 0.35;
        indicatorThickness = 3;
        launcherIcon = "";
        launcherIconColor = "none";
        launcherPosition = "end";
        launcherUseDistroLogo = false;
        monitors = [ ];
        onlySameOutput = true;
        pinnedApps = [ ];
        pinnedStatic = false;
        position = "bottom";
        showDockIndicator = true;
        showLauncherIcon = false;
        sitOnFrame = false;
        size = 0.7000000000000001;
      };

      # ─── Hooks ───────────────────────────────────────────────────────
      hooks = {
        colorGeneration = "";
        darkModeChange = "";
        enabled = false;
        performanceModeDisabled = "";
        performanceModeEnabled = "";
        screenLock = "";
        screenUnlock = "";
        session = "";
        startup = "";
        wallpaperChange = "";
      };

      # ─── Idle ────────────────────────────────────────────────────────
      idle = {
        customCommands = "[]";
        enabled = false;
        fadeDuration = 3;
        lockCommand = "";
        lockTimeout = 600;
        resumeLockCommand = "";
        resumeScreenOffCommand = "";
        resumeSuspendCommand = "";
        screenOffCommand = "hyprctl dispatch 'hl.dsp.dpms(\"off\")'";
        screenOffTimeout = 300;
        suspendCommand = "";
        suspendTimeout = 0;
      };

      # ─── Location ────────────────────────────────────────────────────
      location = {
        analogClockInCalendar = false;
        autoLocate = false;
        firstDayOfWeek = -1;
        hideWeatherCityName = true;
        hideWeatherTimezone = false;
        name = "Érd";
        showCalendarEvents = true;
        showCalendarWeather = true;
        showWeekNumberInCalendar = false;
        use12hourFormat = false;
        useFahrenheit = false;
        weatherEnabled = true;
        weatherShowEffects = true;
        weatherTaliaMascotAlways = false;
      };

      # ─── Network ─────────────────────────────────────────────────────
      network = {
        bluetoothAutoConnect = true;
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
        bluetoothRssiPollIntervalMs = 60000;
        bluetoothRssiPollingEnabled = false;
        disableDiscoverability = false;
        networkPanelView = "wifi";
        wifiDetailsViewMode = "grid";
      };

      # ─── Noctalia Performance ────────────────────────────────────────
      noctaliaPerformance = {
        disableDesktopWidgets = true;
        disableWallpaper = true;
      };

      # ─── Notifications ──────────────────────────────────────────────
      notifications = {
        backgroundOpacity = 1;
        clearDismissed = true;
        criticalUrgencyDuration = 15;
        density = "default";
        enableBatteryToast = true;
        enableKeyboardLayoutToast = true;
        enableMarkdown = false;
        enableMediaToast = false;
        enabled = true;
        location = "top_right";
        lowUrgencyDuration = 3;
        monitors = [ ];
        normalUrgencyDuration = 8;
        overlayLayer = true;
        respectExpireTimeout = false;
        saveToHistory = {
          critical = true;
          low = true;
          normal = true;
        };
        sounds = {
          criticalSoundFile = "";
          enabled = false;
          excludedApps = "discord,firefox,chrome,chromium,edge";
          lowSoundFile = "";
          normalSoundFile = "";
          separateSounds = false;
          volume = 0.5;
        };
      };

      # ─── OSD ────────────────────────────────────────────────────────
      osd = {
        autoHideMs = 2000;
        backgroundOpacity = 1;
        enabled = true;
        enabledTypes = [ 0 1 2 ];
        location = "top_right";
        monitors = [ ];
        overlayLayer = true;
      };

      # ─── Plugins (settings section — auto-update toggles) ────────────
      plugins = {
        autoUpdate = false;
        notifyUpdates = true;
      };

      # ─── Session Menu ───────────────────────────────────────────────
      sessionMenu = {
        countdownDuration = 3000;
        enableCountdown = true;
        largeButtonsLayout = "single-row";
        largeButtonsStyle = true;
        position = "center";
        powerOptions = [
          { action = "lock"; command = ""; countdownEnabled = true; enabled = true; keybind = "1"; }
          { action = "suspend"; command = ""; countdownEnabled = true; enabled = true; keybind = "2"; }
          { action = "hibernate"; command = ""; countdownEnabled = true; enabled = false; keybind = ""; }
          { action = "reboot"; command = ""; countdownEnabled = true; enabled = true; keybind = "3"; }
          { action = "logout"; command = ""; countdownEnabled = true; enabled = true; keybind = "4"; }
          { action = "shutdown"; command = ""; countdownEnabled = true; enabled = true; keybind = "5"; }
          { action = "rebootToUefi"; command = ""; countdownEnabled = true; enabled = true; keybind = "6"; }
          { action = "userspaceReboot"; command = ""; countdownEnabled = true; enabled = false; keybind = ""; }
        ];
        showHeader = true;
        showKeybinds = true;
      };

      # ─── System Monitor ──────────────────────────────────────────────
      systemMonitor = {
        batteryCriticalThreshold = 5;
        batteryWarningThreshold = 20;
        cpuCriticalThreshold = 90;
        cpuWarningThreshold = 80;
        criticalColor = "";
        diskAvailCriticalThreshold = 10;
        diskAvailWarningThreshold = 20;
        diskCriticalThreshold = 90;
        diskWarningThreshold = 80;
        enableDgpuMonitoring = false;
        externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
        gpuCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        memCriticalThreshold = 90;
        memWarningThreshold = 80;
        swapCriticalThreshold = 90;
        swapWarningThreshold = 80;
        tempCriticalThreshold = 90;
        tempWarningThreshold = 80;
        useCustomColors = false;
        warningColor = "";
      };

      # ─── Wallpaper ──────────────────────────────────────────────────
      wallpaper = {
        automationEnabled = false;
        directory = "/home/blueguy/.wallpapers";
        enableMultiMonitorDirectories = false;
        enabled = true;
        favorites = [ ];
        fillColor = "#000000";
        fillMode = "crop";
        hideWallpaperFilenames = false;
        linkLightAndDarkWallpapers = true;
        monitorDirectories = [ ];
        overviewBlur = 0.4;
        overviewEnabled = false;
        overviewTint = 0.6;
        panelPosition = "follow_bar";
        randomIntervalSec = 300;
        setWallpaperOnAllMonitors = true;
        showHiddenFiles = true;
        skipStartupTransition = false;
        solidColor = "#1a1a2e";
        sortOrder = "name_desc";
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.05;
        transitionType = [ "fade" "disc" "stripes" "wipe" "pixelate" "honeycomb" ];
        useOriginalImages = false;
        useSolidColor = false;
        useWallhaven = false;
        viewMode = "recursive";
        wallhavenApiKey = "";
        wallhavenCategories = "111";
        wallhavenOrder = "desc";
        wallhavenPurity = "100";
        wallhavenQuery = "";
        wallhavenRatios = "";
        wallhavenResolutionHeight = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenSorting = "relevance";
        wallpaperChangeMode = "random";
      };

      # ─── App Launcher ────────────────────────────────────────────────
      appLauncher = {
        autoPasteClipboard = false;
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWrapText = true;
        customLaunchPrefix = "setsid -f";
        customLaunchPrefixEnabled = false;
        density = "default";
        enableClipPreview = true;
        enableClipboardChips = true;
        enableClipboardHistory = true;
        enableClipboardSmartIcons = true;
        enableSessionSearch = true;
        enableSettingsSearch = true;
        enableWindowsSearch = true;
        iconMode = "tabler";
        ignoreMouseInput = false;
        overviewLayer = false;
        pinnedApps = [ ];
        position = "center";
        screenshotAnnotationTool = "";
        showCategories = true;
        showIconBackground = false;
        sortByMostUsed = true;
        terminalCommand = "ghostty -e";
        viewMode = "list";
      };

      # ─── Audio ───────────────────────────────────────────────────────
      audio = {
        mprisBlacklist = [ ];
        preferredPlayer = "";
        spectrumFrameRate = 30;
        spectrumMirrored = true;
        visualizerType = "linear";
        volumeFeedback = false;
        volumeFeedbackSoundFile = "";
        volumeOverdrive = false;
        volumeStep = 5;
      };
    };
  };
}
