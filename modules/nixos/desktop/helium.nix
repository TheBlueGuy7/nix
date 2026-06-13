{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.helium;

  version = "0.10.7.1";

  helium = pkgs.stdenv.mkDerivation {
    pname = "helium-browser";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64_linux.tar.xz";
      hash = "sha256-ZHziopdl8ClZQJUHXtIIb9ok/flZoixMdlLMKf5HUUo=";
    };

    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      copyDesktopItems
      makeWrapper
    ];

    buildInputs = with pkgs; [
      alsa-lib
      at-spi2-atk
      at-spi2-core
      atk
      cairo
      cups
      dbus
      expat
      fontconfig
      freetype
      gdk-pixbuf
      glib
      gtk3
      libGL
      libdrm
      libpulseaudio
      libxcb
      libxkbcommon
      mesa
      nspr
      nss
      pango
      pipewire
      systemd
      vulkan-loader
      wayland
      xorg.libX11
      xorg.libXScrnSaver
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrandr
      xorg.libXrender
      xorg.libXtst
      xorg.libxshmfence
      libuuid
    ];

    autoPatchelfIgnoreMissingDeps = [
      "libQt6Core.so.6"
      "libQt6Gui.so.6"
      "libQt6Widgets.so.6"
      "libQt5Core.so.5"
      "libQt5Gui.so.5"
      "libQt5Widgets.so.5"
    ];

    desktopItems = [
      (pkgs.makeDesktopItem {
        name = "helium";
        desktopName = "Helium";
        genericName = "Web Browser";
        exec = "helium %U";
        icon = "helium";
        comment = "Private, fast, and honest browser";
        categories = ["Network" "WebBrowser"];
        mimeTypes = [
          "text/html"
          "text/xml"
          "application/xhtml+xml"
          "application/pdf"
          "x-scheme-handler/http"
          "x-scheme-handler/https"
        ];
        startupNotify = true;
      })
    ];

    sourceRoot = "helium-${version}-x86_64_linux";

    installPhase = ''
      runHook preInstall

      mkdir -p $out/opt/helium $out/bin
      cp -r * $out/opt/helium/

      makeWrapper $out/opt/helium/helium $out/bin/helium \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [
          pkgs.libGL
          pkgs.libvdpau
          pkgs.libva
          pkgs.pipewire
        ]}" \
        --add-flags "--ozone-platform-hint=auto" \
        --add-flags "--enable-features=WaylandWindowDecorations" \
        --add-flags "--disable-component-update"

      install -Dm644 $out/opt/helium/product_logo_256.png \
        $out/share/icons/hicolor/256x256/apps/helium.png

      runHook postInstall
    '';

    meta = {
      description = "Private, fast, and honest Chromium-based browser";
      homepage = "https://helium.computer";
      license = licenses.gpl3Only;
      platforms = ["x86_64-linux"];
      mainProgram = "helium";
    };
  };
in {
  options.programs.helium = {
    enable = mkEnableOption "Helium browser";

    package = mkOption {
      type = types.package;
      default = helium;
      description = "The Helium browser package to use.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [cfg.package];
  };
}
