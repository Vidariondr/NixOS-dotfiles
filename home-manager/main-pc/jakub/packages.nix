{pkgs, ...}: {
  home.packages = [
    # Wine
    pkgs.wineWowPackages.stable
    pkgs.winetricks
    # 3D Printing
    pkgs.openscad
    # Discord client
    pkgs.vesktop
    # Movies/tv-show player
    pkgs.jellyfin-media-player
    # Arduino IDE
    pkgs.arduino-ide
  ];
}
