{ pkgs, inputs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [

    # Desktop apps
    
    firefox
    brave
    vesktop
    vscodium
    polymc
    xfce.thunar
    shotwell
    tor-browser
    osu-lazer
    obs-studio
    heroic
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    vlc
    curl
    zip
    unzip
    gnutar
    hyprlock
    qalculate-gtk
    code-cursor

    # GUI utils

    waybar
    rofi
    pavucontrol

    # CLI utils

    zsh
    fastfetch
    alacritty kitty
    git
    nodejs_23
    pnpm_10
    python313
    python313Packages.pip
    eza
    fzf
    tree
    gh
    neovim
    btop
    stow
    exiftool
    steghide
    stegseek
    nmap
    gobuster

    # Hyprland

    waybar
    rofi
    hyprshot
    dunst
    hyprpaper

    # Other

    home-manager
    jdk8
    xpad
    gnome-keyring

    # Themes
    plata-theme
    arc-icon-theme
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome_6
    powerline-fonts
    powerline-symbols
    fira
    nerd-fonts.jetbrains-mono
    powerline-fonts
  ];
  
  programs.steam.enable = true;

}
