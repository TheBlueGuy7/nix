{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Browsers
    brave
    chromium
    firefox
    tor-browser

    # Communication
    localsend
    qtox
    teamspeak6-client
    vesktop

    # Media
    audacity
    kdePackages.kdenlive
    mousai
    mpv
    obs-studio
    shotwell
    spotify
    vlc

    # Creative
    blender
    krita
    inkscape

    # Office & notes
    libreoffice-qt6-fresh
    obsidian
    onlyoffice-desktopeditors

    # File management
    filezilla
    gparted
    kdePackages.ark
    qdirstat
    thunar
    tumbler

    # Utilities
    cryptsetup
    qbittorrent
    dmidecode
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    kdePackages.kate
    kdePackages.kleopatra
    kdePackages.kwrited
    qalculate-gtk
    sdrpp
    trayscale
    unixcw
    wireshark

    # Development
    android-tools
    arduino-ide
    avrdude
    direnv
    jdk25_headless
    jetbrains.idea
    kicad
    python313
    python313Packages.pip
    vscode

    # Gaming
    labymod-launcher
    lutris
    prismlauncher
    protontricks
    r2modman
    winetricks
    #inputs.polymc

    # Pentesting
    aircrack-ng
angryipscanner
    burpsuite
    dnslookup
    exiftool
    gobuster
    hashcat
    hashid
    hcxdumptool
    hcxtools
    john
    metasploit
    nmap
    sqlmap
    steghide
    stegseek
  ];
}
