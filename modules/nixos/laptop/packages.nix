{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Browsers
    brave                   # Chromium-based privacy browser
    firefox                 # Mozilla web browser
    tor-browser              # Anonymized browsing via Tor
    ungoogled-chromium       # Chromium without Google services

    # Communication
    localsend               # Local network file/text sharing (AirDrop-like)
    qtox                     # Tox protocol messenger client
    teamspeak6-client        # Voice chat client
    vesktop                  # Discord client (Vencord-enhanced)

    # Media
    audacity                 # Audio editor
    kdePackages.kdenlive      # Video editor
    mousai                   # Song/audio recognition
    mpv                      # Minimalist media player
    obs-studio                # Screen recording/streaming
    shotwell                 # Photo manager/viewer
    vlc                       # Media player
    # handbrake             # Video transcoder (disabled)

    # Creative
    krita                     # Digital painting app
    orca-slicer                # 3D printing slicer
    qsstv                     # Slow-scan TV / fax software

    # Office & notes
    libreoffice-qt6-fresh     # Office suite
    obsidian                  # Markdown note-taking app
    onlyoffice-desktopeditors # Office suite (MS Office compatible)

    # File management
    filezilla                # FTP client
    gparted                   # Partition editor (GUI)
    kdePackages.ark            # Archive manager
    qdirstat                  # Disk usage visualizer
    thunar                    # Lightweight file manager
    tumbler                   # Thumbnail generation service
    yazi superfile            # Terminal file manager

    # Utilities
    ghostty                   # GPU-accelerated terminal emulator
    cryptsetup                # Disk encryption (LUKS) tool
    qbittorrent                # BitTorrent client
    gpu-screen-recorder        # GPU-accelerated screen recorder (CLI)
    gpu-screen-recorder-gtk     # GUI for gpu-screen-recorder
    kdePackages.kate            # Text editor
    kdePackages.kleopatra        # Certificate/GPG key manager
    kdePackages.kwrited          # GPG password entry daemon helper
    qalculate-gtk              # Scientific calculator
    sdrpp                      # SDR (software defined radio) receiver
    trayscale                  # Tailscale tray GUI
    unixcw                     # Morse code training/practice
    wireshark                  # Network protocol analyzer
    # bottles               # Wine prefix manager (disabled)
    hollywood                 # Fake "hacker" terminal screensaver
    zpaqfranz                  # Archiver/backup tool (zpaq fork)
    veracrypt                  # Disk/file encryption
    bind                       # DNS server/tools (e.g. dig)
    tldr                       # Simplified man pages
    openssl                    # Crypto/TLS toolkit
    kiwix                      # Offline Wikipedia/content reader
    kiwix-tools                # CLI tools for Kiwix content
    youtube-tui                # Terminal YouTube client
    inputs.yt-x.packages."${system}".default  # YouTube terminal player
    ncdu                       # Disk usage analyzer (terminal)
    duf                        # Disk usage/free space viewer
    ripgrep                    # Fast recursive text search
    lshw                       # Hardware lister
    mtr                        # Network diagnostic (traceroute+ping)
    rmpc                       # MPD terminal client
    iotop                      # Disk I/O monitor
    progress                   # Shows progress of coreutils commands
    dog                        # Modern DNS lookup tool
    termshark                  # Terminal UI for Wireshark/tshark
    magic-wormhole             # Secure file transfer
    croc		       # Secure file transfer(but better)
    lazydocker                 # Terminal UI for Docker
    moreutils                  # Extra handy Unix tools (sponge, vidir, ts, chronic, etc.)
    unp                        # Universal archive unpacker
    asciinema                  # Terminal session recorder
    agg                        # Asciicast to GIF converter
    wireguard-tools	       # VPN tool
    glow		       # Terminal markdown viewer

    # Qt theming
    adwaita-qt                # GNOME Adwaita theme for Qt5
    adwaita-qt6                # GNOME Adwaita theme for Qt6

    # Development
    android-tools              # ADB/fastboot Android tools
    arduino-ide                 # Arduino development environment
    avrdude                    # AVR microcontroller programmer
    direnv                     # Per-directory environment loader
    jdk25_headless              # Java Development Kit (headless)
    jetbrains.idea               # IntelliJ IDEA
    # kicad                      # PCB/electronics design suite
    python313                  # Python 3.13 interpreter
    python313Packages.pip       # Python package installer
    opencode                   # AI coding assistant CLI
    zed-editor                  # Fast collaborative code editor

    # Gaming
    prismlauncher               # Minecraft launcher
    osu-lazer                  # osu! rhythm game (lazer, source build)

    # Pentesting
    aircrack-ng                 # Wireless network security auditing
    angryipscanner               # Fast IP/network scanner
    burpsuite                   # Web app security testing proxy
    exiftool                    # Metadata reader/editor for files
    gobuster                    # Directory/DNS brute-forcer
    hashcat                     # Password recovery/cracking
    hashid                      # Hash type identifier
    hcxdumptool                 # WiFi handshake/PMKID capture
    hcxtools                    # WiFi hash conversion tools
    john                        # John the Ripper password cracker
    metasploit                  # Penetration testing framework
    nmap                        # Network scanner
    sqlmap                      # SQL injection testing tool
    steghide zsteg              # Steganography embed/extract tool
    stegseek                    # Steghide password cracker
    xxd      			# Hex dump utility
    tcpdump 


  ];
}
