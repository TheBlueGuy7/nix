{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    eza
    fzf
    tree
    btop
    lynx
    zip
    unzip
    gnutar
    curl
    p7zip
    pkg-config
    fd
    rar
    zenity
    wget
    openvpn
    cifs-utils
    ripgrep
    inetutils
    scanmem
    imagemagick
    pv
    glew
    fastfetch
    taglib_1
    rofimoji
    xdg-utils

    thunar-archive-plugin
    thunar-volman
    thunar-vcs-plugin
    thunar-media-tags-plugin
    xfce4-exo

    nitch
    ffmpeg-full
    parallel
    mkvtoolnix
    yt-dlp
  ];
}
